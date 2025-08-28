Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5712ED85E
	for <phone-devel@vger.kernel.org>; Thu, 28 Aug 2025 09:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756374664; cv=none; b=dNhgoUGNRPDmNHoblPAKN62Hgu9P0u06duO+OKJjKlU8G0VIqcJMsNCSVoprcuGf9NgZxeJCIjUDm3lEOZ+DDOSCa3/ndWtkSjSazobkAvB7jMfVTUnySPjbHRMGJF1yslNYeoZM8XUjUnYGU6jzMWt3XY17bmAF2UnppQ3emyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756374664; c=relaxed/simple;
	bh=WJI7Nd2+jQ7AaubXsM8kTP+G3+wwCUgpfmopC+FK8tE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IbvZ1ndJG3TY8b5U8kTec1SKgXq/5/mwwF6mW1lGTU3dzj/tlMhjdsIDiitSX3AHT0nnyW2RGtwYK3F0DravAv6l4g10YRBzm8wes8wbh95ySIu1rH2KaNng45ubZai34law4+rQPIJ/HY+Ekf1LcItPtgVrY/EFRI13OL8P6zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=R53Ja39T; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="R53Ja39T"
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1756374653; x=1757674653;
	bh=jgSVyNvKT8tyvT/0XuoEo9brNM1Cm43Vrq9buFP014k=; h=From;
	b=R53Ja39T30QOM1NlhT7e/7bA2JxalQbl0TlvpE5eVDx3h8RYX+YmMfQ0LBIIrKYqD
	 pLhj0hGeLDy089hgAZNBuDRBpi72pQTsgqr5j6++/zKaA3zQedSCYONaN9FYnbmsQs
	 e/VcHUXb/DjlStD2gxnqcZz5RP4Mz6WVTyd1zxHPO5EVj4+zk1HxeOqkJ5/AiXSiMW
	 eHZZw3n9q0nW2CoY8R9ww3DneGrDepqsYowyUxeurxYPh8kRkNdX8qWGjX5pX7Dvgt
	 8G4/pFsYzf72/NkNQFO2iXVLBtfQYUjkAlNUph+bRscAJaK2jVQnskxT3oFUHbJ0/W
	 ZkD7ymMSPFtAg==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 57S9oqFd046278
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 28 Aug 2025 11:50:53 +0200 (CEST)
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
Subject: [PATCH v2 2/3] arm64: dts: samsung,coreprimevelte: add touchscreen
Date: Thu, 28 Aug 2025 11:49:03 +0200
Message-ID: <20250828095028.24503-3-balejk@matfyz.cz>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250828095028.24503-1-balejk@matfyz.cz>
References: <20250828095028.24503-1-balejk@matfyz.cz>
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
index 54131b0e5617..0ac1a24dc410 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -311,6 +311,11 @@ pmic@30 {
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
@@ -328,6 +333,16 @@ ldo14: ldo14 {
 
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
2.51.0

