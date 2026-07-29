Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ADB489889;
	Wed, 29 Jul 2026 19:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785353518; cv=none; b=LRfABucw6cez25QC6Cr/3Y+FyoHfqAAhPOC07ubK2dPf9/7RkbSEETANl8WgPeIlH5qTIc9b8+N747nbyd4sE5v4hRWZCLhT4fW+fMIDwNmgMKEDzsaWmlmseg8rVGBeL5a/aeykNMZoh3A3/rfLRT0wHLvD9GCPWaq3+x3hwn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785353518; c=relaxed/simple;
	bh=njKX5nMi/BB4PBjZJqeSHGLDdF+n9bbUseU5Biwk/Mg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nylHKKDTz4CsHOYPzSrUXQekIsJ5e/MQWdpNI2JoPLTcq+TiBqHar8kQ0IHJCtyg1y7TbF0XubeOBLTZq4wySdonE8Uz1DmsYb7xCaJU3JV38oYSpYm9GxmcqaVU+Vv3tyy+X67w0Zb+/tSDlOAabskiw1dvq1MV9X4r6lcEqNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFaLHxAT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFaLHxAT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BCECC2BCF7;
	Wed, 29 Jul 2026 19:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785353518;
	bh=njKX5nMi/BB4PBjZJqeSHGLDdF+n9bbUseU5Biwk/Mg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VFaLHxATq5JowIRA0x5Cl5Saq3eK5BkopRxl9c4vPt4Xd3cxjXA2/o6+vbOB2X00I
	 iC6CzIDSjz2IGSjVo+NE+utDGK9+vy5dRBDQJUlZJ3iPAjeJK5raFixTPZkGYm+gIE
	 SQjI1LSZVDjdcM+Xs/20Y3DKq06lpQDYZLZk4KdADlmg+m2A+ZqZ/iucbpweo3LYG0
	 ivuSKEOorpj6ORtsh0mGgarySDTrduUFr5fNr3Yb6uYqqpgxC+oD6bSGlnExvCB746
	 M9r90xIcDhSGEtY4N5UYJ2dYvgEctw3ShVnazMwFi2HYPxS2Jql2Vqb39Iar7aToKP
	 Zx8xPbO/igZZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE09C53219;
	Wed, 29 Jul 2026 19:31:57 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Wed, 29 Jul 2026 15:31:54 -0400
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom,sm8250: Add compatible string
 for SM8475
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sm8475-asoc-v1-1-3edad8aa7628@proton.me>
References: <20260729-sm8475-asoc-v1-0-3edad8aa7628@proton.me>
In-Reply-To: <20260729-sm8475-asoc-v1-0-3edad8aa7628@proton.me>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785353516; l=837;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=9EIfnewBFvPepUyMsmU4lM3BbcorxKblP5HJ2b6wAfs=;
 b=i2Crzn9HnZ7Bg6O1T+D0aJcZzOafCjVocxob+FSMQs7j7b4X9IuyP/EighMhKC2F1ZBP+JQfU
 gDw9t7AmrQ8BqUlEFUx+vgq0Sz2amcho64BbpKOidBQboi2UHDZwU9E
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

Add compatible string for the sound card found in the SM8475 SoC.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index bd5f5a6268a3..d12ac528c33f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -26,6 +26,7 @@ properties:
               - qcom,eliza-sndcard
               - qcom,hawi-sndcard
               - qcom,kaanapali-sndcard
+              - qcom,sm8475-sndcard
               - qcom,sm8550-sndcard
               - qcom,sm8650-sndcard
               - qcom,sm8750-sndcard

-- 
2.55.0


