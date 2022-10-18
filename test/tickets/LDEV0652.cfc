component extends="org.lucee.cfml.test.LuceeTestCase"{
	function run( testResults , testBox ) {
		describe( "Test suite for LDEV-652", function() {
			it(title="checking EXIF data from ImageGetExifMetadata function", body = function( currentSpec ) {
				var uri=createURI("LDEV0652/test.JPG");
				var EXIFdata = imageGetEXIFMetadata(imageRead(uri));
				expect(EXIFdata.Make).toBE('Apple');
				expect(EXIFdata.model).toBE('iPhone 5s');
				expect(EXIFdata.Compression).toBE('6');
				expect(EXIFdata.Flash).toBE('16');
				expect(EXIFdata.Orientation).toBE('6');
				expect(EXIFdata.Software).toBE('8.1.2');
			});
		});
	}

	private string function createURI(string calledName){
		var baseURI="/test/#listLast(getDirectoryFromPath(getCurrenttemplatepath()),"\/")#/";
		return baseURI&""&calledName;
	}
}