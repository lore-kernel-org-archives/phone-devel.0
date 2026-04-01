Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1753EF0A2;
	Wed,  1 Apr 2026 22:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775083180; cv=none; b=Z5ouhz+OVtWEOxbiHBDnbFZ+DXwSEFhCiXvlGf7iebIgTx8eWVCXuWgFbGsV2xtq/Bws6WCCjO0hMcjZcc8LuAVPjGNO2daEjsop5reiZP+1CGx0cbVPwC0DCKLVwIPIvP0EZL/CeVSx/knEkFbgbwim5oCXyf2xVNDbnjKpe04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775083180; c=relaxed/simple;
	bh=WGPWC0OpPwVrxkhxIk6P8I2euNSrt+X2xneIgg45hY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ys5Dt5A4Puw+IEJieb10QV4VEuRk+Lz+LfMdrRdtHDba++Kz1w1byYoPlk/8ry1GXqXY31jA/NrY9bDmbXO4IUjdSNceDqtoJjIixjsQ/d6cPXp6oYs85DYx8jXazOBD8S+Tz541YvOSrunIB18me10G7K1GN18ItlfIoTgOVI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bxQcY41R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bxQcY41R"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EC2DC2BCB2;
	Wed,  1 Apr 2026 22:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775083179;
	bh=WGPWC0OpPwVrxkhxIk6P8I2euNSrt+X2xneIgg45hY0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bxQcY41RRKmrZ87svmjri2tOkmJkNVqbPC/vVNnIyLCkfI8jAsyZ5cdwVPx3lAVcm
	 bvR4SN9Y6wBeCEFWCjFVExV9VtMyIvsKK8ErCzm7cajQgczqkndwfF9CU7eoWQV/6L
	 G2UcKHsKsfbFDsxuN7EMXbu0201q7WZ/XReU4EyX5PnENBOA1N/iI14TuBwL3/zYWf
	 l+PrlJv8JF3El9utOD1MV39fgoyEv6vvpwGHeNHFIo3+fKkTv4qoYECmKnfq1dhoyG
	 4jUtEIJ/lVinhl38jLPUAEwi1H7IYe90KmaFK/W5PBzjgpWMxKgHdYs0xZfCsBmh1b
	 Y+7bg0i08fXqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 468AD10FCAFA;
	Wed,  1 Apr 2026 22:39:39 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 02 Apr 2026 00:39:37 +0200
Subject: [PATCH v4 3/4] arm64: dts: qcom: sdm845-shift-axolotl: Convert fb
 to use memory-region
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-beryllium-fb-v4-3-46170004da28@ixit.cz>
References: <20260402-beryllium-fb-v4-0-46170004da28@ixit.cz>
In-Reply-To: <20260402-beryllium-fb-v4-0-46170004da28@ixit.cz>
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
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpzZ6pHRyFSYYyLRZSL/TNiTj6Do2Md0cQOP7X0
 s3L4IbAg8KJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac2eqQAKCRBgAj/E00kg
 cm2sD/4uehhD9AFQDG+GalI2LIZlNF9XBsx/Y/jVYmjY0CI02LmtBd2pz6IVvBv/0k+mgkc3hvC
 sIoFmjkRhmw9gjtCeeEfnWd/2FlbXnKdVdGouglPaJONvne/t6mGpPvEFMhT1GDDi83MOdR0j5g
 G9Vxfdktg1jeTYhloSYoJiAsEOIsDwEo8fa3SsaY0TcjL4hRpy4UVvwBdREKwcTvPy+gZFoINii
 4vJhAHrEaKfaJPZx5O1yz+DY7qohXje9eKFY8Nc9Zd9NQhqTM0sArWg6zz0MfXeTv1ZEGvOoaDX
 SaBlNk02CymnHhHYS/Dr8me4xts2Id5ZOKPMe5+XVrBsPUEe4r14Rxb8uOELWNPP/HyqOpFj2GU
 W7lXtujsPOAz8RBfWshPBz8UqSqhwBD/owoRjDaMWshS1kQKkzketK+6ZL4V988tB2LoAyH6o9i
 AX0ttZfXc7BTlIQPR2t21lAWelKunDO6cV1LlS9CprWwF2+bwS2AejB3dWt6wB774YAaorwtZvu
 tk3oRJ5jxyLSX/gpbKZ4TU84xgY42hQ5DfiHDyWhMSu5IFEYDwRAAcDmedIfJ9k0qSo/ZYtnN4u
 iIapS+9KX6EtykGIG8qGy5fXGul9a5ZkHqVLXY68DMgC5+lqwZU+GpSDAOYi7X/ar4BqUr8SIJL
 baSzgn8uARsG07Q==
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


