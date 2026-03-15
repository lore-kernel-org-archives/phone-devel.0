Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19F5363C52;
	Sun, 15 Mar 2026 16:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773592124; cv=none; b=iq1gNURPSdEUOy9swzI34Hg6CzVXyVPAHAwHefo3jzaJCxC/dLhD7aBBtnMo/EIDjcuLBXPQbd6DWYyhPdA98GoFu13Nhdh1QnVevCL0jvtNFRWk07ogduuqk3Yx5lT1sM7Fg5nGuV/Z7+fEsOsAMjel4bzHgCDsG5zmz/fbwoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773592124; c=relaxed/simple;
	bh=B6na/U+THg8LrPqCDbstI1XBLNOH6fIJCMpLt3jR2qY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aYfHNb5px/hI4xcQHDb6jCxF4cjtQLBZ+vdq41glcw6vC9OE4JuOXKUJCs/xBMzCUd6ynFHiJ1kzhBUxy7NQCzQ8Wehuz81eVbgP9SyI5y7DbiGJgZNUyfswScQxeno2FacHxtQZZQVFEYWNBh4ip0gU2Ef4lIOe64EF+ed2KUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=mpantis8; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=GM/E0kpW; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="mpantis8";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="GM/E0kpW"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1773591983; bh=g3mjN89PsZmipnaVD+kP8Ai
	FQ4NK3/jQ9cxGX5Ph/SI=; b=mpantis8jGga48Ic7szY4NKZSqW8xyAulFCwHukb1LqkstHmVa
	tP7o5SmvhkCKWeVsbTiUhoA25U23WD6p1sgvY1pQUMOeIORNvMhoyy9wQy3O+bW3n1C/DpuXP+M
	kFnkpiVu2vK0GX/vOtOwE55t+h5R8c8oAHLcNbMGv6FIgJWzKs8rsHHwvoEdOXp159wq8rodJjd
	PfhkgHYt3oDJzttHWv4N93sp2WxVZSYqc4Urf/dAjAh71pPVtlq9deH3Gcn6CfO/fy36/FTJ2jd
	8hZ/9BJaQF6sUQSkBNKOL793DjOfoMVuT1l94DY3lLw5kycv+PrPKP3ZqOTtlWXS5Pw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1773591983; bh=g3mjN89PsZmipnaVD+kP8Ai
	FQ4NK3/jQ9cxGX5Ph/SI=; b=GM/E0kpWl6EWZ77jKdufXYlNba1bdkt2s1iLOLO5vWkwGjroV4
	epYAZr0uA8CI0TgSbInywIk3CEW6r+vtoUCg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 15 Mar 2026 17:26:19 +0100
Subject: [PATCH v3 1/6] arm64: dts: qcom: msm8917-xiaomi-riva: Fix board-id
 for all bootloader
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260315-riva-common-v3-1-897f130786ed@mainlining.org>
References: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
In-Reply-To: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773591982; l=1009;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=B6na/U+THg8LrPqCDbstI1XBLNOH6fIJCMpLt3jR2qY=;
 b=F7mI9uzCJ8JZUUbaVaTTOvz4EogIpOgLysSCsWp5UYKb32baQ6fXATnZ4i46O+lTcmdwMTKyu
 T+H75a9m2TjCnWIpJdnifQMauEULUKUqrdAKIcCnSqfpm+/xdGXyPnt
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Redmi 5A comes with multiple bootloader versions where the expected
board-id is different.
Change the board-id to unified form what works on both bootloader
version.

Fixes: 26633b582056 ("arm64: dts: qcom: Add Xiaomi Redmi 5A")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index 9db503e21888..1bfb16f90ddd 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -18,7 +18,7 @@ / {
 	chassis-type = "handset";
 
 	qcom,msm-id = <QCOM_ID_MSM8917 0>;
-	qcom,board-id = <0x1000b 2>, <0x2000b 2>;
+	qcom,board-id = <0x1000b 1>, <0x1000b 2>;
 
 	pwm_backlight: backlight {
 		compatible = "pwm-backlight";

-- 
2.53.0

