Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CA737BE6E;
	Wed,  1 Apr 2026 20:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775076017; cv=none; b=qLIKVjJuFrONpXilRqw94xWNQY1vUCywI01iAp7NuhoTx9lJsKbKOJbltPm8JnJoYSpq7ZB0Nw5pFGwCN2q1TwkyBxxey+9sGSx+E2LYSnfsbbWfiVZPrfmYciusR4dAmLTZp13/sSQZQ4Brbp93Sgj9WZ1I9h2Nr1Lt14+THc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775076017; c=relaxed/simple;
	bh=WGPWC0OpPwVrxkhxIk6P8I2euNSrt+X2xneIgg45hY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Szq9RM2LBeCGlv97U8lzaBx2DY1oVZkQ+dRfJSg94UcI4FQJOlXENBa+QxSVHx+lDGgycJF5Z938vip3Iawj9rU4Nta9HexpWaTvLs+mx69BjrvEAvqKuY4MtuageCfn+dJ5Fb5jSRFlzPohj5qBhOcnTwooEzcG+earIu80Kxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ntzu4GWW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ntzu4GWW"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F516C2BCB3;
	Wed,  1 Apr 2026 20:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775076017;
	bh=WGPWC0OpPwVrxkhxIk6P8I2euNSrt+X2xneIgg45hY0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ntzu4GWWVZdaR8aLVowTfqO+tOx4TKXOzD/fiy6AtFyFJmJ6Qg+xQ1buoqd83eIrk
	 ecoB/nseAbQuXI0KwunUrcknHJkpKwJW4edePm24dVgC6HvoZngHkXC7nszc0+Biom
	 kA2gu8Oh1k2iz5Q1lMZRR4IsowiFD5HpqK/UPvaKksLmjjAEC/XqnKEFev2WHaPjLX
	 7WzNn59J+OqPGFtqIAvKvhNd1+TYqcaZwuyTOo2XPeZnUAmIhNjzgphvaNeuQM1dTH
	 sFkZJnHlDIhjCzBFC0eplZ2+7HGRGwOrCviwjpZAqXspHh2jK+zaKYGTcASDemLEED
	 0A/YO5bRho/hA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CFD10FCAE2;
	Wed,  1 Apr 2026 20:40:17 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 01 Apr 2026 22:40:16 +0200
Subject: [PATCH v3 3/4] arm64: dts: qcom: sdm845-shift-axolotl: Convert fb
 to use memory-region
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-beryllium-fb-v3-3-ec7d443402ab@ixit.cz>
References: <20260401-beryllium-fb-v3-0-ec7d443402ab@ixit.cz>
In-Reply-To: <20260401-beryllium-fb-v3-0-ec7d443402ab@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>, 
 Sam Day <me@samcday.com>, Dzmitry Sankouski <dsankouski@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Petr Hodina <petr.hodina@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1355; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=D5MWNeEDbREP1CY/G2xbH5lREdxUtDqmzDAssXMN22Y=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpzYKu9kIyOgQCRgFC5IBYjrv+2demvqAVpbNM/
 qbBWcmvplWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac2CrgAKCRBgAj/E00kg
 ct7SD/wLa3/+aQwIM8t95Eg9VjpUaQNFTnvFegPVj5XxKIz0NxuF7fHYc4nuiPu0D8L2rQ4cppN
 GQKFDxXFB4YxnllkQv0wueKE9LZpNvQRoe4UC6yFG89a8yryp1v2f0G8I4DB9bHi0jkFcKtxoW8
 LJi+9ZYA9id9VZ6o3huwDiqS2S2CLOOnEPRTAlfyXAHljaaCCgEPYH3N87rb8AyTZiEY3budMcN
 wpJNt6arUw2vKFfvKe3pJmQb68qgCuohhh0vEks5AYtwyE77FsXjOpM74K30pgGpy+cRmkWb0Y0
 cXlBYgFFEN/S8tcvEpeluGLMX7Jv8nQZ4G2nefW9c+p1aTOuv315qRZcm3Ch0oMrQW5pCaUTwXf
 vCbMAXTNd1wfnwXMJifaNfck7Cg7MB/l1QcJQ0PZ3qM0cnOnpO2x9sX3AjtrcBDF97QHieiF+PI
 FzLrancw3Nma7eCCTE/dbKY8Wryf4UcZBWFzpwosnP9TQodMQmzBYsXh+q3YCMa2K3pz8owMwfA
 AEHuxAk/xBoI7kRRacSfjf8EIa2tHnPGG5ZYwJ+MQQs9QrH9f3O3DOVUze8PUecBkz+J3r6n+3S
 uppedzA7SSi6EVC+R4rWRiM3c8Kq6+Gk11u3kr0Lm3ukXw4MpL50q+mhTUDjVh6ZVjEt9ILaF4q
 +l/XLgLz8gjVscg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Instead of manually specifying reg, reuse the memory region.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 740eb22550724..88d970268e282 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -23,7 +23,7 @@ / {
 	qcom,board-id = <11 0>;
 
 	aliases {
-		display0 = &framebuffer0;
+		display0 = &framebuffer;
 		serial0 = &uart9;
 		serial1 = &uart6;
 	};
@@ -36,9 +36,9 @@ chosen {
 		stdout-path = "serial0";
 
 		/* Use framebuffer setup by the bootloader. */
-		framebuffer0: framebuffer@9d400000 {
+		framebuffer: framebuffer {
 			compatible = "simple-framebuffer";
-			reg = <0x0 0x9d400000 0x0 (1080 * 2160 * 4)>;
+			memory-region = <&framebuffer_mem>;
 			width = <1080>;
 			height = <2160>;
 			stride = <(1080 * 4)>;
@@ -62,7 +62,7 @@ key-vol-up {
 	};
 
 	reserved-memory {
-		framebuffer@9d400000 {
+		framebuffer_mem: framebuffer@9d400000 {
 			reg = <0x0 0x9d400000 0x0 (1080 * 2160 * 4)>;
 			no-map;
 		};

-- 
2.53.0


