Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D5E35F5E0;
	Sun, 12 Jul 2026 03:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783825963; cv=none; b=bq4DgPTnX9IVUcC9oAFtgFyr0G32+jZGOksjdNdpcIVVpi0DGt7+ldKw4S7I0IPl93CjVUotpWsC+BqmLXzhZXDjV2+b/LDsygygoW66kYriPZmysBog9h7lJGkpX2EB8GhGnT2H29Y5/IPxE90epVBpdiICv9j3VOFwOTUmUPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783825963; c=relaxed/simple;
	bh=uypZPYFNrzVPlbgo3JFazgpwIcp9nk1xnzIGuAXrb5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CH4MnSYaMJQN98OqxEuUgCP8P4MZRHNYwviMvWiKhYkGOPViucN7IQqceSsXWPCtQZo2JTRv11j4wV98d6kPwRi6Xyz6koUBc2FTwSfrl2Fj+qjpvBLZlifU+WEVEHeQbP0tGmliUcRddMhfyKjP+ti/c/JIDuK9aYaoKxQjKl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibWQii7J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibWQii7J"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19AB8C2BCF4;
	Sun, 12 Jul 2026 03:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783825963;
	bh=uypZPYFNrzVPlbgo3JFazgpwIcp9nk1xnzIGuAXrb5A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ibWQii7JDUG6EDE7cokuu+dyGUqdt8TBaj31klj9vFDmB3OKZOQHj4pQavBiNIuRt
	 zAsoQi5cTjrBLUDTjbU9mKdnnrgFiN0yO20fiRMQFDxrt/1qGpTZspTvE53VDZQV6k
	 zecE0ROAhuc2HIaYLaov2KhCHeLr57BYqPxmvCDtAaiii6iqtb9jN86bmUBXtfAECA
	 wVZFTNzIXkHAwFNP6UheA1PsKoumSCMugmtzGwznVUDMm1LEmtHFfgePWbyC8SiK/K
	 RL/z+oXs0B8FiextvRxCnKDKPH4dJyPBcMliPB6UQk8rwIu2dvxbm4kCKBa5z0zw7a
	 ShjNlCWwWLIRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0349FC44506;
	Sun, 12 Jul 2026 03:12:43 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Sat, 11 Jul 2026 23:12:27 -0400
Subject: [PATCH v2 1/2] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-sm8450-qol-dts-v2-1-5eb2e86468c5@proton.me>
References: <20260711-sm8450-qol-dts-v2-0-5eb2e86468c5@proton.me>
In-Reply-To: <20260711-sm8450-qol-dts-v2-0-5eb2e86468c5@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Esteban Urrutia <esteuwu@proton.me>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783825961; l=1232;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=f6mm6bP5cP/VdfADQcuVdSA9XTjnVcdOZJRex2sxwV0=;
 b=TcIlcP7ncJW4UTVFJGgshY/59oDIvuuhLqZRG+qXZfwBKb2XPfoB6I8mkK7K5ngv4SZaLpm9D
 b7akfWYyzlaCxCAXlFd4dEkcJSVpvlmnzy2ApXKKooXSHkiPc+h1dlq
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

These nodes are not present on downstream device trees and only take memory
away from the AP.
No crashes occur without these nodes, so remove them.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 7ddd0f5f539c..cf7c8f831fb0 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -752,11 +752,6 @@ oem_vm_mem: memory@bb000000 {
 			no-map;
 		};
 
-		mte_mem: memory@c0000000 {
-			reg = <0x0 0xc0000000 0x0 0x20000000>;
-			no-map;
-		};
-
 		qheebsp_reserved_mem: memory@e0000000 {
 			reg = <0x0 0xe0000000 0x0 0x600000>;
 			no-map;
@@ -806,16 +801,6 @@ qtee_mem: memory@e9b00000 {
 			reg = <0x0 0xe9b00000 0x0 0x500000>;
 			no-map;
 		};
-
-		trusted_apps_mem: memory@ea000000 {
-			reg = <0x0 0xea000000 0x0 0x3900000>;
-			no-map;
-		};
-
-		trusted_apps_ext_mem: memory@ed900000 {
-			reg = <0x0 0xed900000 0x0 0x3b00000>;
-			no-map;
-		};
 	};
 
 	smp2p-adsp {

-- 
2.55.0


