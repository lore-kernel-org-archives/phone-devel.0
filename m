Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E29B320A24
	for <phone-devel@vger.kernel.org>; Tue,  3 Mar 2026 03:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772509788; cv=none; b=rz/zg1zwHyL+xh5u8l3arnvLVOh3QEzUfws1NoBGN+bFeOg3HPSv2zo8GOyE+5AS14Dd/H9lIOi0xP+lfV8u/yP4W60cfnEqFqu/ovHusaFCiBY/v2r4Llnt9qV5GmrN2p6Z2sqc0OVNTt1+umlzS/ELm0UDpYuXuD0rWhv0Cuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772509788; c=relaxed/simple;
	bh=vN79aVq15KJmINuT84+yvI/rNP53bO1GbNxLL6+n1X4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aUSvlT8D9naqqkg+UAPAQQDu+3qjlkJCCHEBZTxUDnZgb0uOK+MYG0SdXweBwSZk8oq0F+RGUgW7j9ATvS0qVkrqOExYSx4hksPja1BWYIhPSCyik6nSii4YLC93AoLtMT/GSU8V8Sgx9XvQ4Vx71EEzV44L9YKUsI2PY7yNxFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=iwlq95Vi; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="iwlq95Vi"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772509785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RG3ZEWSeGQFYP6X+wKEUzoO+lwsoqVPpKdpIj2KNtZg=;
	b=iwlq95Viltjvmj7iTI8ddeSwNwPa5T3QmnsjyOA6iZqWSNooRBUI9g1T13+Tv2ZiNNtfdv
	9vn0XRPWN+2f5H/0BDwrmkeCyRDihW+VmNTEV+v1h4NuTYt4LiNKtq4hpwp6b1bj7mVsny
	ERlTbtbNftenIXUKCsgGVnJEV1Tlg7AMRRlGsEPefT9bd7qG+BS0+fQCRPQTh91gxm9xhM
	4HxDp+QZ1eQ1i0f0yK+dIYh1cI9GJqeC2H8lW28sNb3ham+3ibDDNq5hHrvVTFZdvDyeY8
	PF2/jP1P2vUzt9z43ijicnYCrjEAC8IFC4kX4XTJODukNl2ubdFjwBrtlHKp1w==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Yedaya Katsman <yedaya.ka@gmail.com>
Subject: [PATCH v3 6/6] arm64: dts: qcom: sm6125: Add missing MDSS core reset
Date: Tue,  3 Mar 2026 00:41:25 -0300
Message-ID: <20260303034847.13870-7-val@packett.cool>
In-Reply-To: <20260303034847.13870-1-val@packett.cool>
References: <20260303034847.13870-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

To make sure the display subsystem starts in a predictable state, we
need to reset it. Otherwise, unpredictable issues can happen, e.g.
on the xiaomi-laurel-sprout smartphone DSI would not work on boot.

Wire up the reset to fix.

Fixes: 0865d23a0226 ("arm64: dts: qcom: sm6125: Add display hardware nodes")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Yedaya Katsman <yedaya.ka@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 80c42dff5399..a22374e5a17f 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -1238,6 +1238,8 @@ mdss: display-subsystem@5e00000 {
 				      "ahb",
 				      "core";
 
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
 			power-domains = <&dispcc MDSS_GDSC>;
 
 			iommus = <&apps_smmu 0x400 0x0>;
@@ -1437,6 +1439,7 @@ dispcc: clock-controller@5f00000 {
 			power-domains = <&rpmpd RPMPD_VDDCX>;
 
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 			#power-domain-cells = <1>;
 		};
 
-- 
2.52.0

