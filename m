Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761E18F40
	for <phone-devel@vger.kernel.org>; Sun, 26 Oct 2025 19:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761505348; cv=none; b=Hf8rL1XmWnAUD9/BibX55Kq7Sl7uKGCSAF9owiws6UDv06D/uhwk+U0kqAS90fUP3VWAucNL/P66e5kEA/1jJDb0cISsFAsTVzAc5NyfclCPnrSWbmuY5ws/RB0Fsx8peyY38torRIhoZayhJ4tj409AAFl23PjJpGVz4xSVKIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761505348; c=relaxed/simple;
	bh=0HhYOYWxfjpg+9Kq7lCk7i1xML9Xo3LVDTHR8xeZOSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kVQlDM5cOVyFr4a23fxeZdYReZzXiiR+009fF41tfSgVndPQdFNfrZUU+7yNIl0Ko3Q2vNbdB/59Oo4t/DOZZcrhpup2NrcJZvbL8PPEhCKqhLRYbZFQjUW+x6o7vZKFFzH56cwcC2aTjRLVM9bScVqnWYGMIjflu3oFOhBmcug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=Alvj1afz; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="Alvj1afz"
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1761503228; x=1762803228;
	bh=thIl0eoythKb01PWr+ANwhU9Ff6R4yl+rTHFbaUTblI=; h=From;
	b=Alvj1afza8dYCwi0s/dGQRKNnatbHJflZbyYAYLJg0iaHsYdPTg3Ak3CnTSa4Mj0T
	 H7D49mQ8BjVd6krsOK2qcgoUc+ziHnYRt+izW8yW5fOTXibom0SCSpm5T8R+lez2wG
	 IH+5VJA0oCzOJikDRjHyosg72fInAPlXBsxFcGOlsemuBl4w+5/qAhGjowantpx9Nt
	 4bbE3S4MQwnMaQBd1z/FRxlpSFbfr+lyJyfPOiogPMx5p/QPF4w4FsIpWTMybkc9+1
	 mgO4TnvKR32d8Bbl9mpwf9iyFCHyr9+hCHs9VY70agWF1DWPTFUBAutZ6YDA5NVFF5
	 Y4GCS7skZiphQ==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 59QIR6Wb043073
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 26 Oct 2025 19:27:08 +0100 (CET)
	(envelope-from balejk@matfyz.cz)
From: Karel Balej <balejk@matfyz.cz>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Brian Norris <briannorris@chromium.org>,
        Francesco Dolcini <francesco@dolcini.it>,
        Ulf Hansson <ulf.hansson@linaro.org>, Frank Li <Frank.Li@nxp.com>,
        linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mmc@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Karel Balej <balejk@matfyz.cz>, Jeff Chen <jeff.chen_1@nxp.com>,
        Peng Fan <peng.fan@nxp.com>
Subject: [DONOTAPPLY RFC PATCH v2 4/4] arm64: dts: samsung,coreprimevelte: add wifi node
Date: Sun, 26 Oct 2025 19:20:41 +0100
Message-ID: <20251026182602.26464-5-balejk@matfyz.cz>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251026182602.26464-1-balejk@matfyz.cz>
References: <20251026182602.26464-1-balejk@matfyz.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a node for the phone's WiFi serviced by the Marvell SD8777 chip a
communication with which happens over the SDIO. Also enable a regulator
without which it is not possible to connect to networks although they
are discovered properly.

Signed-off-by: Karel Balej <balejk@matfyz.cz>
---
 .../mmp/pxa1908-samsung-coreprimevelte.dts        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index b2ce5edd9c6a..36d6ae4e902e 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -475,6 +475,14 @@ ldo14: ldo14 {
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <3300000>;
 			};
+
+			/*
+			 * Needs to be enabled in order for the WiFi to be able
+			 * to connect to networks.
+			 */
+			ldo15 {
+				regulator-always-on;
+			};
 		};
 	};
 };
@@ -523,6 +531,13 @@ &sdh1 {
 	pinctrl-1 = <&sdh1_fast_pins_0 &sdh1_fast_pins_1 &sdh1_pins_2>;
 	bus-width = <4>;
 	non-removable;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wifi@1 {
+		compatible = "marvell,sd8777";
+		reg = <1>;
+	};
 };
 
 &pwm3 {
-- 
2.51.1

