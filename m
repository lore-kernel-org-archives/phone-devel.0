Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C2544C63
	for <phone-devel@vger.kernel.org>; Sun, 24 Aug 2025 11:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756035135; cv=none; b=ujdKrSUY7kfmDUUFZxRhe8Ey6iWosvRJgfUh0OV2YshWxFM+kGn8qJOppdHwivWpruk9ePAhsXEKNtWE4f7FyOatPh9bseKHEYayK0URxDnrFAPvmCWIUMKI4kBXTObVF0h6BSRST66QvYRVYr3bTOC+C/VzcwBC+iC1AfAB2ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756035135; c=relaxed/simple;
	bh=jRWqCu6ox8FhYgTv8HmAvGfmvKNLit4r6YWSaS4+4zY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oj59fvYo0K0C2EkCt7iwbagu8tcYHjUIGFF1wKySM525nJC+UCXUWey/e0D9YigOkuGWK+8H8Q45Z9uOs0wHQXlS1kyHnN+uECZ3klOz791A7EXVF4+ZOUDpc8KE8C3kp5mG9gUToBFm/GXnaEGvV2HHxw+h3o/9kc/et598h+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=bXRStTSj; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="bXRStTSj"
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1756033284; x=1757333284;
	bh=XpMC3BrM1uIB0XbsX1fqE/ZITuthT+QHhc9H0DCFYDU=; h=From;
	b=bXRStTSjPngcKJy7ovasYiZxGDbWwFqFjxD7iCJDgaYdEg2czS3dN9Xwq17YhZh94
	 LdpKiMYPy9/2x75MYkbmijSSQZUrU9r9fYu5uXS6M4AmVSgF5v5aBtl02sjXFIwqF8
	 43YlJDgh3l0/Wv9PMgV5TdZkKpDwBXhHnhQ2OYSsQ4PoGnFJDkemrPVHqXHxILVl6D
	 3iRpkoGXsxGKh5DIHx/t9zLMy9hMuVKHDQ22lUEvm133+5zScxn6QuQ47XZ7KIR8It
	 gHw/PBFLLEHK6bptL9cTxSHwgJnKs/KrLAT0LF9RFZfs7clzEApjUXlSI5HaXEKvnN
	 rwfEun+gfal9w==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 57OB1N4a083637
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 24 Aug 2025 13:01:24 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
From: Karel Balej <balejk@matfyz.cz>
To: linux-mmc@vger.kernel.org, ulf.hansson@linaro.org,
        =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Karel Balej <balejk@matfyz.cz>
Subject: [PATCH mmc/next 2/3] arm64: dts: samsung,coreprimevelte: add touchscreen
Date: Sun, 24 Aug 2025 12:53:44 +0200
Message-ID: <20250824110039.28258-3-balejk@matfyz.cz>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250824110039.28258-1-balejk@matfyz.cz>
References: <20250824110039.28258-1-balejk@matfyz.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bind touchscreen for the samsung,coreprimevelte smartphone. The
downstream code sets the VDD voltage to the exact value of 3.1 V,
however it's been empirically verified that the lower bound used here
sufficies for the proper operation of the chip and is thus used for
power-saving purposes.

Signed-off-by: Karel Balej <balejk@matfyz.cz>
---
 .../mmp/pxa1908-samsung-coreprimevelte.dts        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index 240021e7a371..834b2cf1a204 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -312,6 +312,11 @@ pmic@30 {
 		wakeup-source;
 
 		regulators {
+			ldo2: ldo2 {
+				regulator-min-microvolt = <1900000>;
+				regulator-max-microvolt = <3100000>;
+			};
+
 			ldo6: ldo6 {
 				regulator-boot-on;
 				regulator-min-microvolt = <1200000>;
@@ -329,6 +334,16 @@ ldo14: ldo14 {
 
 &twsi3 {
 	status = "okay";
+
+	touchscreen@50 {
+		compatible = "imagis,ist3032c";
+		reg = <0x50>;
+		interrupt-parent = <&gpio>;
+		interrupts = <72 IRQ_TYPE_EDGE_FALLING>;
+		vdd-supply = <&ldo2>;
+		touchscreen-size-x = <480>;
+		touchscreen-size-y = <800>;
+	};
 };
 
 &usb {
-- 
2.50.1

