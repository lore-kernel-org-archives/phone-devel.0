Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DC52F362D
	for <phone-devel@vger.kernel.org>; Tue, 25 Nov 2025 08:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764058400; cv=none; b=kQCYrAgYoxssa2CjC+8SkXFlcrdzF27uVGfS41hJ3rSJVDAmYC4dir0u0uTRXur0kqbMls/0qFUYI6MDaojQjXlByecE+tG7G/ohR6+7zR6M5sYNeStaUAzvjBL+xv369VdfOOzs35Atlvo5pfH2IE5qO04bdhNGBSo7NTo/i1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764058400; c=relaxed/simple;
	bh=/F9DFqeBDMYKaicC3Mr1MiBi7fq1TtQPDVImvfv+7vA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DdCvpSZ0vjgvoVgc4TlrrLAUXNAeaOCoXKDrQnJREZ1r4Xr3NRy9L+pieZUEWMkLROxrG2mzPrd+ScD38g2YCUnZcTT5VACWH3CZAgdRL8ga6zJuJdTD5C0s7ywDdVBl8feWsOTskzcGzX1QoNGLHFl7y1B92RQhTWBDPyIhteg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=fVV8ZD/K; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="fVV8ZD/K"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764058396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TQiapsVnVDqRg9GSoQT1p4g+PF1xFf2n1iW6RdOUi5I=;
	b=fVV8ZD/K1l2o8D5mQyLji9fswKcinH4beBXfCk/yfxHcztDm4JZVVaXO+jTkpf5oLwZ5Dp
	MvOVGrt6Mj0lU8OGahjqEDyxmBGZGdIMd7WjGmBEKMD+eNRArBW/GAz1JW70e/Oye9AiVZ
	ga8MZNNEx17pMu20IvJB5VS2Bgbg9bQunHSwzGEDZZpGuGWTM0mV6qFgUEHMWqcj7ilprb
	PGjPaiN5TQO9fQaEgRFygPG1vo5kJeCeM0BZIvJT1RXsZ0FaC0aG9x7Mwp4kMS/J1sr0xq
	IGRm2osxc5yeH8FKWIW2IeK2oiRgu22fcR4y7ugIGka7Tm8364WFdTetO0itqQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 25 Nov 2025 00:12:36 -0800
Subject: [PATCH v4 06/12] arm64: dts: qcom: sdm845-lg-judyln: Add firmware
 nodes, change path
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-judyln-dts-v4-6-a5a60500b267@postmarketos.org>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
In-Reply-To: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764058372; l=2755;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=/F9DFqeBDMYKaicC3Mr1MiBi7fq1TtQPDVImvfv+7vA=;
 b=5MbqAE3ibOWwbR/kXQLR7cnVtNQk/Xob1DdzoiRB9ICMX1TKHZrJOqZUUplElHsOt+IrBLKuR
 Dmjjg+QtxmsAv1cihbY+dvSj3O9fCbizHhYZVofOyNQSEDsbHrNPouX
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Add paths for Qualcomm firmware, including:
ipa, modem, bluetooth, venus, gpu

Enable adsp and cdsp nodes since their firmware is present

GPU and bluetooth are confirmed working, others may need more
testing/fixes

But regardless they will need the firmware paths specified here
and firmware added upstream before they will work, so might as well
get started on it now.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 10 ++++++++++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 23 ++++++++++++++++++-----
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 50921af83a51..315fdc5dc392 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -162,6 +162,10 @@ &adsp_pas {
 	status = "okay";
 };
 
+&cdsp_pas {
+	status = "okay";
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm8998-rpmh-regulators";
@@ -464,6 +468,8 @@ &gpu {
 
 &ipa {
 	qcom,gsi-loader = "modem";
+	memory-region = <&ipa_fw_mem>;
+
 	status = "okay";
 };
 
@@ -663,3 +669,7 @@ &wifi {
 
 	qcom,snoc-host-cap-skip-quirk;
 };
+
+&venus {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 8e4214b83bf1..9ec2edf6134c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -35,7 +35,7 @@ battery: battery {
 };
 
 &adsp_pas {
-	firmware-name = "qcom/sdm845/judyln/adsp.mbn";
+	firmware-name = "qcom/sdm845/lg/judyln/adsp.mbn";
 };
 
 &bluetooth {
@@ -47,11 +47,17 @@ &bluetooth {
 };
 
 &cdsp_pas {
-	firmware-name = "qcom/sdm845/judyln/cdsp.mbn";
+	firmware-name = "qcom/sdm845/lg/judyln/cdsp.mbn";
 };
 
-&gpu_zap_shader {
-	firmware-name = "qcom/sdm845/judyln/a630_zap.mbn";
+&gpu {
+	zap-shader {
+		firmware-name = "qcom/sdm845/lg/judyln/a630_zap.mbn";
+	};
+};
+
+&ipa {
+	firmware-name = "qcom/sdm845/lg/judyln/ipa_fws.mbn";
 };
 
 &mdss {
@@ -96,7 +102,7 @@ &mdss_dsi0_out {
 };
 
 &mss_pil {
-	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
+	firmware-name = "qcom/sdm845/lg/judyln/mba.mbn", "qcom/sdm845/lg/judyln/modem.mbn";
 };
 
 &pmi8998_charger {
@@ -135,3 +141,10 @@ sde_te_active_sleep: sde-te-active-sleep-state {
 		bias-pull-down;
 	};
 };
+<<<<<<< HEAD
+=======
+
+&venus {
+	firmware-name = "qcom/sdm845/lg/judyln/venus.mbn";
+};
+>>>>>>> d58184825fa5 (arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes, change path)

-- 
2.52.0

