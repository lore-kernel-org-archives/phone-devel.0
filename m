Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF80B388E7A;
	Tue, 24 Mar 2026 02:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318095; cv=none; b=S78HtVnu7L1SdFjMq9oENncePFLQ8E9kmAqKgRpLIaTOIqncrURSQRsKHG3rY2CPLp/sXpcRiablQRQbX7DX8CsHE68DQarDgQ57cbj8qNesrzaUpXkQW2jDmOJzaTtmG+465yBUdOcanecM3xvCoWbItUd2UiV3KDuYTKOqyqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318095; c=relaxed/simple;
	bh=AUbNt9bkdLSZ5QkK/hcA+7IkrHZ2PlNCqypxIYS8Qbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ud62fHXPwyzWVTIQrmKuM0oolM2a2mF8qd1xSKBQdD9wj07w98+Eyu75Cie8eiODWbC/pe/bTx0hcU9HW/g6VeOpJKoIUrmH3dy5Ma0JGla6pZ8yr270awI4agOm/1XojMojeylFYiXTHpaDWvHrCZ1FHDv+R+tJjNo9AADI4qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=d8DlUwlx; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="d8DlUwlx"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774318091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NUnX8U0vGNYbiWJDSXf/rQHLWWU9UA2ht6+fCiuJYII=;
	b=d8DlUwlxZSJmrnPRe5RA4S2yhWWAwU73EvqEISM/aakZwU0WEyk4mP8DpChC/OtAVzHr9c
	rYxpc6mUPKAVE0CeJldfe78eGkcWo1m6E0FNfjS3mlyEqO9Xk3MfkLr8wBhOvndh62Y22A
	rybf8hLlYyuXeBGe6JuuMikQn512FxfyauWR3Teei90ul19OsqqQc6zE5YNISEtWGNu5FF
	IAGFP948YFgyvXOCX0Csmu8tgFjjQHVYdHwQSFM+OOfBFTqovERFbGRyDuMb7VuhXBcZtd
	WE9PY3MmxYMmWoh4rNEw/wDXTreIh0bHTYOmbDS2DcKJHxwXzQJlLVZ1e607+A==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 23 Mar 2026 19:06:39 -0700
Subject: [PATCH v6 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add firmware
 nodes, change path
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
In-Reply-To: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774318055; l=2213;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=AUbNt9bkdLSZ5QkK/hcA+7IkrHZ2PlNCqypxIYS8Qbg=;
 b=vSHapH9YDWnRkaN4wNWSEpOF0jmRuuMn2Kb8OF+et8rzRZ9ENwC+tmGduSsDbYwG/BMVN2UrR
 W4qrXGoO2lXA75wzeMKibLKWvrQkr6JdNuu7GZ05Pk5NFMEY3fdDQKF
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Add paths for Qualcomm firmware, including:
ipa, modem, venus, gpu

GPU and bluetooth are confirmed working, others may need more
testing/fixes

But regardless they will need the firmware paths specified here
and firmware added upstream before they will work, so might as well
get started on it now.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi |  2 ++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 16 ++++++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index a5a04ec11eb7..dd42ed0bf63e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -464,6 +464,8 @@ &gpu {
 
 &ipa {
 	qcom,gsi-loader = "modem";
+	memory-region = <&ipa_fw_mem>;
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 46119630d721..7948fe3dbaa2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -46,7 +46,7 @@ battery: battery {
 };
 
 &adsp_pas {
-	firmware-name = "qcom/sdm845/judyln/adsp.mbn";
+	firmware-name = "qcom/sdm845/LG/judyln/adsp.mbn";
 };
 
 &bluetooth {
@@ -58,11 +58,15 @@ &bluetooth {
 };
 
 &cdsp_pas {
-	firmware-name = "qcom/sdm845/judyln/cdsp.mbn";
+	firmware-name = "qcom/sdm845/LG/judyln/cdsp.mbn";
 };
 
 &gpu_zap_shader {
-	firmware-name = "qcom/sdm845/judyln/a630_zap.mbn";
+	firmware-name = "qcom/sdm845/LG/judyln/a630_zap.mbn";
+};
+
+&ipa {
+	firmware-name = "qcom/sdm845/LG/judyln/ipa_fws.mbn";
 };
 
 &mdss {
@@ -128,7 +132,7 @@ &lab {
 };
 
 &mss_pil {
-	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
+	firmware-name = "qcom/sdm845/LG/judyln/mba.mbn", "qcom/sdm845/LG/judyln/modem.mbn";
 };
 
 &pmi8998_charger {
@@ -167,3 +171,7 @@ sde_te_active_sleep: sde-te-active-sleep-state {
 		bias-pull-down;
 	};
 };
+
+&venus {
+	firmware-name = "qcom/sdm845/LG/judyln/venus.mbn";
+};

-- 
2.53.0

