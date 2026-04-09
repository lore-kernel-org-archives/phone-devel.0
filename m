Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CA42E6CC0
	for <phone-devel@vger.kernel.org>; Thu,  9 Apr 2026 02:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775702552; cv=none; b=d4px+ZvoQY9h9ifozCGKVbTSExyj191t5keN+FKQ/NeinpbBSBruMUZz0gHomsA448JI109tvWCoeD52JkCjFfZbO27/lvCAVhVz+YKuIVT9PWSSTb+CuivxpXcoYJtokgl8NeLg9Kzyk+huK4DvVql8DJ9C7a811djwJKjbRg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775702552; c=relaxed/simple;
	bh=b41vryXTlZGVACV6obcpZ3vRxOD8S8meSNXDHVJyLrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Shat3DSCK+TSfW4Du+1N/Yi27P0uYcknQYqKZSyXvWCvVkhiYtwqONR6LJXAfU6xbsmJC2LABYd+PtcYef1MiyQeDo/4y3ViO7iKUHVKI00KqzGRxT2VM7bvNBcxA5+lpkkWXY+aNNf0z6aMc/CnF9KzLv2DcCaLvo/hxu7H0a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=qX6DgjFq; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="qX6DgjFq"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775702542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KwdMuylHPk9Z8Q2g31GCL4Mu1tyY8FuQogF/LUyO874=;
	b=qX6DgjFqTuPPBEMkzkP1yMUzrjy5OhZ5z1ZLXtMbhkQLnVe1HQHWvOddvHZONmFzMzhSpR
	M/aNI5WTSBUjszR5txki/hCZxv+iEtT1U9YQezfy0LXX1lUBsGbYOBgtkJ8UvlUuskmYp4
	1Ek9kzwS0rJukg/TKIVxYeKQXsK0aX0zlfcaj17kROemPKyfT1EsYdJKKcNx4+NY5dl1Mh
	IwnYo3o1JJfOb6ROhwJ7eOLC0U9WT7fWPfbJpbP+j0jVQqgJIZDvwLMg/zesiyMcEHv1wc
	FH8G6fbhKc0vIFY8gCK3omKIeKenG5gQI2sTvFtmgmhg3UehrQhtunVDVR84kw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 08 Apr 2026 19:41:14 -0700
Subject: [PATCH 3/4] arm64: dts: qcom: sdm845-lg-{judyln, judyp}: Reference
 memory region in fb
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-judyln-followup-v1-3-823467519b59@postmarketos.org>
References: <20260408-judyln-followup-v1-0-823467519b59@postmarketos.org>
In-Reply-To: <20260408-judyln-followup-v1-0-823467519b59@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775702528; l=2164;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=b41vryXTlZGVACV6obcpZ3vRxOD8S8meSNXDHVJyLrU=;
 b=6hyJOKbuKXCPuje13ICRYj/XOFD+JxFnF1iOg6LxI/4oD/MH04QHK86TFROcICAQvJHxUokIE
 +zGY2UEvrsaBGqUxc/3H88/MKysp/KIcv3N/8dlEkhymIKJu4gknKMo
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

To prevent duplicating the framebuffer address and size point out the
existing framebuffer memory region instead of specifying the address
manually.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 3 +--
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 4 ++--
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 85dc4468b6c4..86cf4eb44084 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -98,8 +98,7 @@ spss_mem: memory@99000000 {
 			no-map;
 		};
 
-		/* Framebuffer region */
-		memory@9d400000 {
+		framebuffer_mem: memory@9d400000 {
 			reg = <0x0 0x9d400000 0x0 0x2400000>;
 			no-map;
 		};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index adf41aa0146a..349faa123ff1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -14,9 +14,9 @@ / {
 	compatible = "lg,judyln", "qcom,sdm845";
 
 	chosen {
-		framebuffer@9d400000 {
+		framebuffer {
 			compatible = "simple-framebuffer";
-			reg = <0x0 0x9d400000 0x0 (1440 * 3120 * 4)>;
+			memory-region = <&framebuffer_mem>;
 			width = <1440>;
 			height = <3120>;
 			stride = <(1440 * 4)>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
index d244ebdd17be..44e762f78e95 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts
@@ -14,9 +14,9 @@ / {
 	compatible = "lg,judyp", "qcom,sdm845";
 
 	chosen {
-		framebuffer@9d400000 {
+		framebuffer {
 			compatible = "simple-framebuffer";
-			reg = <0x0 0x9d400000 0x0 (1440 * 2880 * 4)>;
+			memory-region = <&framebuffer_mem>;
 			width = <1440>;
 			height = <2880>;
 			stride = <(1440 * 4)>;

-- 
2.53.0

