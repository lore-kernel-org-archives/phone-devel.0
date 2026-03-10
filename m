Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55F336606A;
	Tue, 10 Mar 2026 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773163306; cv=none; b=OVP0ETxVttgz3rGZYwbwZEFXBUW8jCLQBktHRunoIKY4jMpFRbGI1H8nnmkfamp2YqKsYFUilZHXNixA/d8O9nz3MblHeVxocu4XCrTqwuxbgdEFCgvTLcORwQ1jSaQTFEE3jxIcKrFRm1ktDZJvOakLzQQRqx4r98+kZkKULm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773163306; c=relaxed/simple;
	bh=i1e4h/rvl35JWBUmBdG8Ijp3z1P+uEzOGUnHYNNpuSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R+M9yE3vhoo/+aJIJMfyJFgosdYt5ss+Z5Y/VL0lc9Ezyd2WFZsr0o64V5lDf46Mt/MgEmPjD9XW/4hVviEFqmVW52tuxSi7SbJuq8z0jUJaSbUjUPkNJ0Bmz+vTnXbFtAnkAdXYQc9xolP0lOehpuHaahm+o7thKj0GsnNfIJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=snS9t+Bg; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=pqIeVwt2; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="snS9t+Bg";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="pqIeVwt2"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1773163297; bh=EQAebAB4qzDMBIZybdLJe06
	OLVcmRdjVBENtrfTyOgo=; b=snS9t+BgmSJNenMDyG49I9ffLM+5OathmROap/T7rAwdr7qTqp
	lwcuwo8OhAqjo8CnQ75LuT+3AzkpcE8MoGH6OrQTaI0eMF7kmF1Gt2H0NJHB8p7cusANlMIRyBt
	/5QyC8NnzKQ+dKHyJpHiemCmS5RT6hgsA9/4ULElsg8xb0tRx24hQiL6RppokPIJ/TJLnhunguY
	RxZx35Zdw0N6Nra7KCRY2PoGxjaOqP3iXLHdOmtGoS8NBJDlshJQ63qYHJhCLsI+yW847Mf8Cs+
	D210uI/xedV/if+ZAfqFlGDL6OshIdFfABLZgGq6BH3J//x+4DU1+Cpg2zDULNg8NQA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1773163297; bh=EQAebAB4qzDMBIZybdLJe06
	OLVcmRdjVBENtrfTyOgo=; b=pqIeVwt2kwOFC00rObFu2foG7brMrgBL2FlSYN5x/ZuPrWobvp
	txTEM/PFN37MSITIvwCev/wGQIjlpiW50fBA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Tue, 10 Mar 2026 18:21:31 +0100
Subject: [PATCH v2 1/7] arm64: dts: qcom: msm8917-xiaomi-riva: Fix board-id
 for all bootloader
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260310-riva-common-v2-1-3bfc23996857@mainlining.org>
References: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
In-Reply-To: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773163296; l=948;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=i1e4h/rvl35JWBUmBdG8Ijp3z1P+uEzOGUnHYNNpuSU=;
 b=pafn2lETt2O0mm+AuLKPeFH8L3oq0MJ4IwTeVa19cZMlbAypeVQcaMe2ysbrD2CRMP86UQstS
 2/7Vb/7rFkcCJGXNS6c5qKtuOEwy3z7Ag3k8TgFMgXhxUTiWEctHQJZ
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Redmi 5A comes with multiple bootloader versions where the expected
board-id is different.
Change the board-id to unified form what works on both bootloader
version.

Fixes: 26633b582056 ("arm64: dts: qcom: Add Xiaomi Redmi 5A")
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

