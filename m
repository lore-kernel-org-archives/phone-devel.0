Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E56B3093D3;
	Sun,  2 Aug 2026 19:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785697468; cv=none; b=m76EEb8yOQjcW2VWjJTMbfG1L+s0Lsiay/ZHSwha/s3JdOr03oggJNkg/ZwPIAlppUi03D0gle7WZznBbkpY6xw9oo376kjbLqnYJXo1BW6sKLxRHlF9khXWETDPQo1n6MD1o3WXmpPAJiKlMp+kmzA2h8a0cwZJO1YJsT6zp8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785697468; c=relaxed/simple;
	bh=l1gpYEnvDx1KF4CNT3YGlbY+z/rSf5x40XWcfmlE4Vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TIm6A/HfTP+RcdsIhRvyaXxNHarYBTQw5z+XnsfuHicPX3fVjC4ExjH6VfObtzOtDLq+krNFrejxjsiyjYSbHs1K3vmdKqWKDT1z+kPfg3u2D433/ELdMBC0K/jvJqSwzEoWCGTG63a/pQQ8mIR3lhja7divlcNGy1m9TJNmh9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M27ovrpG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M27ovrpG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B200CC2BCF7;
	Sun,  2 Aug 2026 19:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785697467;
	bh=l1gpYEnvDx1KF4CNT3YGlbY+z/rSf5x40XWcfmlE4Vs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=M27ovrpGTNiiahHpeD6G8khbpX+C08wHFk50aM1LK/9ogTu1CfLn8VN/mQBqWr2O8
	 ZM6yGW5pdHQ7GjUwd3clJoohm8ys09/4nULknteORbCS9FzKof6ZDFwPuaazBK/Lr2
	 CRh8xgfO1G3/mxayFuratth/T4LvBTgixamTgluaxi030+DLBKNcnp9mWYcTQ5PWBE
	 CB1t5+Uj1w8kJ0XubxBnTPDrbhkbW8nd0g5woTl7GDdxs4BKOL6pTehzT0+uKh1BiL
	 uMcccScGjlYitCdu1zWZRSygQ/adte5/MU9j3kibhvGFT2Em4PfnbUA8FNs+EjVLjc
	 xg8fSAGG3qxpA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92DD9C55177;
	Sun,  2 Aug 2026 19:04:27 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Mon, 03 Aug 2026 02:03:45 +0700
Subject: [PATCH v4 1/7] dt-bindings: mfd: syscon: add qcom,msm8960-sps-sic
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-msm8960-wifi-v4-1-5ffa27aea39d@smankusors.com>
References: <20260803-msm8960-wifi-v4-0-5ffa27aea39d@smankusors.com>
In-Reply-To: <20260803-msm8960-wifi-v4-0-5ffa27aea39d@smankusors.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785697465; l=1190;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=gdOSMGyxu7XT+8t+prN4QnQGqbJwQkQ6SKm5MLr4Wec=;
 b=A7dVi0HyE31iHJDtmGNnb6PXOU/ic6nrWu9PQuFboDw2smi7hkRVIz/dnIPA448h5pMGkyDB6
 RacdkanQ9xNDWW2X0XeZB0xwdfo/zzupusLejuKv9MLXAgrR0mJ5fet
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com

From: Antony Kurniawan Soemardi <linux@smankusors.com>

Add compat for Smart Peripheral System (SPS) Interrupt Controller (SIC)
present on Qualcomm MSM8960 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index e22867088063..5f12ccf4483f 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -107,6 +107,7 @@ select:
           - nxp,s32g3-gpr
           - qcom,apq8064-mmss-sfpb
           - qcom,apq8064-sps-sic
+          - qcom,msm8960-sps-sic
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos
@@ -221,6 +222,7 @@ properties:
               - nxp,s32g3-gpr
               - qcom,apq8064-mmss-sfpb
               - qcom,apq8064-sps-sic
+              - qcom,msm8960-sps-sic
               - rockchip,px30-qos
               - rockchip,rk3036-qos
               - rockchip,rk3066-qos

-- 
2.34.1


