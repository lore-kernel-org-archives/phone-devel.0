Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125AB389104
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 02:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318097; cv=none; b=C1UREPMzTLqTYk9xr7Cs9/5CM9Jsvymrzl9ZOAnSzATzLXzkY/HPVR6cU91oPlnNsgepDakpY+BJwE0ur4PF0qPt+YQMhvA+vKjOKzc4J7Ptch1vc/6OoSoFqeyRQBma3JYPriDcsHnwKDRq9Pc/k7AiWk0LESHcaIg435k7Ju8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318097; c=relaxed/simple;
	bh=SEFcdueJD85iyqkCdkA1eVWENjkhhviV/+O4y//xpns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kfh4ljPyAVmq9c2o/cS3Dltco71Nm0p5EC+Uy3qRbHVBIZMETrTCFXAAzwA/6lwMq7XoylfivJ+zoYDcOYr/FJgPPJY0Yg4L25eFXC+TWKkUl6k46ID8dimdbHO8oRVUqdbWAtBNCsCENLhREbrWxTzteONVXr1QvvnrqHcItak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=fz3sWQXy; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="fz3sWQXy"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774318094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3jnLf1G4bAcO43KeLkvnhRy++7EFh1Y5HlTcUGTeZyE=;
	b=fz3sWQXyftwtTojyk3mSudfnYhhjHvWEet782Kzfgt0+H4iof5LBNCBJp/o8FssxNSvdnk
	FsE+GudEYeQ+CLGYGcgTBPVu+rc/+2aFZmrVyXy8wyoBMBFAV6AYSaaqbRxzIUzzHKbb8y
	uYY34n1VS0oEUqFfcImbhM3lhfr/6sAA1BQyc+n8u4eahdo+ONG1z4an92+m82GO6EIw5x
	R+e90SYMSVaZL92XvEvJYAHMoauBQ0BEdT0FenH+dptPXzeHN6X0YDuVV4GAOfQrD2DoJA
	BiTZKwsl1cBCjG+Vb3Rw99YN5/QBGKNyVwedrX6E33DI65Qjluyl5dWIgsZv9Q==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 23 Mar 2026 19:06:40 -0700
Subject: [PATCH v6 10/15] arm64: dts: qcom: sdm845-lg-{common, judyln}: Add
 wifi node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-judyln-dts-v6-10-29d70ca1651c@postmarketos.org>
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
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774318055; l=2313;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=SEFcdueJD85iyqkCdkA1eVWENjkhhviV/+O4y//xpns=;
 b=hsgKjJdIRR2FEMlqA+K9UgHjWruV+ks4Ys49lOn7AqwA62He8ldkL0lpYzvnjf8o4RJ//M0sX
 0kOuv9tKskMAqnn9NRxgFwfYJR33HOXqcXngzsagjdc27jinR6nsLAm
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Wi-Fi now works with this patch, relevant firmware and
qcom,snoc-host-cap-skip-quirk

qcom,snoc-host-cap-skip-quirk has not been approved/merged in mainline,
so it is not included here.

ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
ath10k_snoc 18800000.wifi: qmi fw_version 0x20060285 fw_build_timestamp 2020-10-12 23:35 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c4-00645-QCAHLSWMTPLZ-1.336037.2
ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 1 tracing 0 dfs 0 testmode 0
ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
ath10k_snoc 18800000.wifi: htt-ver 3.83 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
ath10k_snoc 18800000.wifi: invalid MAC address; choosing random

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 10 ++++++++++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index dd42ed0bf63e..50668bb73b09 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -664,3 +664,13 @@ &usb_1_qmpphy {
 &venus {
 	status = "okay";
 };
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 7948fe3dbaa2..adf41aa0146a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -175,3 +175,7 @@ sde_te_active_sleep: sde-te-active-sleep-state {
 &venus {
 	firmware-name = "qcom/sdm845/LG/judyln/venus.mbn";
 };
+
+&wifi {
+	qcom,calibration-variant = "lg_judyln";
+};

-- 
2.53.0

