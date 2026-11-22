Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795374487;
	b=axmRdXF7W3Jf4E0XiloANB3tadwwYPxFJE+2dl30u+GPE/Vq5x6u114KEbJHAjNruZbz
	 RHL8Q4+VQbFKE4Lt4XoKIg4aCHpHk2bGEv2G+eFvBm7V7oGrfbblicnPJoJEWrWgFJoFS
	 ZEI6GoC1RVbvFLrbGq48ETT7ZxSWrdBf3WLy2PVWY8kd3DzT8Kow+fC1JH8W82LVVMGOm
	 cYKlQhWVm7OFgqEIqXPVBRo9QdUOGlt7oW6za2HQRrVs61V0z5Dw+8sBk3BSwcJg5bTqF
	 SHCxkZ4avTgWtHGirZqVyEd1ivLYwVRBTXExvruGSN1AvZmlzam40Ao+ic75AsXilDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374487;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NXUaTp9bYrQ3qJpc2M62MfPuOfqjrnX+68f1OJ6btRs=;
	b=ZomlqbdW5CDo4vD7AyihcFoMxsqMxv/MrdBX/cDh0mbrzA3ajySqTbOi/UPJo+N16VTJ
	 MnaZIhBUPUomMkJOH1yjmWkK4unTp4Q/3M0bxIQ9sKLQoW66jr9+IvuUO9CAXRQiAwMw4
	 vWdEKwC4yfe19HL50OMJjkBlQxLqdp8mFJCA2UvgSDeZ4IBD7uNzsUPjawh8QfVoHwVBH
	 BVDzCt4zqpCBzcRMKq21U+h2iW9js3yUOJz102K6iVoc+QjW5SIztwEU349QblPKDakI1
	 Nmzv18bulVqEf0btFP2/wkTVpVPaTM8hyS7IiY4dnVstxpYoD7ZueBZgGaaXrgyqYfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2Onyrmp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4CA606A33C;
	Sun, 22 Nov 2026 19:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2Onyrmp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795374487;
	b=miiali1R5CaT4EHSTEhLEiJp9jkDivz3H9BBV2ZXVCw37nppvMB5Qdh/q6T0yu8uhNbg
	 kgFmdsSpgWOWnqpuNc2EZviMdnGdQ+drh2u81qcK2Kaab1hGTXLqm8h29Yq3E04Q9pgQq
	 zOVPArofKa/IAoRiIazRUK/dPbPX+rvpvfBgS7E/SYC7vI3KgsC8b8KpVg7DpXBfuJlne
	 Q6i5C0Wqmpp8oWxDWM1OFFFmraAkonhL72zQdCyHQkrAmqJ+soF/O8hShzb+3VmeNNYpY
	 U1U+E5USbAs81jkvvdwaUUlZHUzmTV57CMCx3rpPO898rpIGAbKw1v7XunbVb8GZ7yw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795374487;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NXUaTp9bYrQ3qJpc2M62MfPuOfqjrnX+68f1OJ6btRs=;
	b=SiiPvjlwJBj04bPO280fx/9rVC1zaXO5e8uzHqFc3B8fZ0pbCuOP43+aTokccKcr+9iI
	 xwKSUGOFtL8Z/BWXJk9QciPsavze0o929NKfyZzDNLesH4FTZv3EmYTkpS4Joa/uOJ1tu
	 PcH5PUv5FbCjGzGxf0mn+OFZGgyBWt5IFWgLuiEH/fDBWaC9fCF0JxDEtDJzYYGqjFSAJ
	 m7Ak3H6Ve3Zj+474w3RY6bsultzUgXbjKE3QVLIfhx+nvTgQHwO3n6FzlExEfYpglm80Q
	 QnHHBC2AhrP8+tmhbZj/JtbiPfnX1ZgDyXTgjSOpv5NxRKzPk8p1P6wmvugFY8J+1RQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DBA031F000C0;
	Sun, 22 Nov 2026 19:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795374487;
	bh=NXUaTp9bYrQ3qJpc2M62MfPuOfqjrnX+68f1OJ6btRs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Z2OnyrmpU7IgQukCoIohzRh31L0dMMfCaZf6LfJvhDpMdWFeGl19CGDNrQ3NK33Y0
	 9D/z/tJ9zpD7ZoGx0kr2pIW9OfO5sMq+CHP16hjgvH7VwMQez77ick343cVVKpWKUH
	 KO1E7BgfQjk7QtY4LyHpMZxdFOCpajWYiuPc98xznsYEUrhK1TWGFoWah+CK8/PDq4
	 Fx0VH7T1u1m4S3/IMMkrkEBjOfRM7VR7FxVmY49T/lmm69jN3E916BxJfgb2K65KAB
	 O605s+gzdsSl1or8LvqykwmqepgpR6dPZ7rul1LdVvB/6lwXh5aMpbsMbvG1SedJ1V
	 VwLrHgCnc9wAw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CEE654C1B5;
	Sun, 22 Nov 2026 19:07:48 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 23 Nov 2026 00:37:52 +0530
Subject: [PATCH v4 07/11] dt-bindings: arm: qcom: Document Molokai and the
 Motorola Signature
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-molokai-soc-v4-7-851e5a9f4878@yahoo.com>
References: <20261123-molokai-soc-v4-0-851e5a9f4878@yahoo.com>
In-Reply-To: <20261123-molokai-soc-v4-0-851e5a9f4878@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795374466; l=883;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=EMR0bzongKtYLt4CKK8C1JzDACXZlOzy7AkZudtfYqk=;
 b=Rmv7QuFeshkRVlX3/gtCDHhSiRIZc/fdz5H7RHTQ8jjq3RIXVCI+fcg7wfXXPgR/vhzzDReYL
 ZBMYcqebBMTAww+6fMwko88wXr2ivu+uMyVEH4/Z05tZD5d3iAdZdf2
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Document the Qualcomm Molokai (SM8845) SoC and the Motorola Signature
(vantage) phone based on it.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..6993bbffef9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -241,6 +241,11 @@ properties:
               - nothing,asteroids
           - const: qcom,milos
 
+      - items:
+          - enum:
+              - motorola,vantage
+          - const: qcom,molokai
+
       - items:
           - enum:
               - microsoft,dempsey

-- 
2.56.1


