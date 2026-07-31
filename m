Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8D22E03F1;
	Fri, 31 Jul 2026 05:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785474173; cv=none; b=UXEkZ6/ZWBWhBzNp45xQwAt6nJ0+OMfpjNhW1leyqzspmqsJR0jl/4SpxEjy/1B0WCLNkyw5mcxQfUoRKlcZVpseR/R6xfAsU+HiC8tVK/LkKAyHovWLYhmAm4kFlZQbbI+Gusimu4CCgInsxas3X8xAdrm9t1Jv2UevJzlRTJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785474173; c=relaxed/simple;
	bh=0GlR4bJ81KetsUvVTlRU06Cu889JBV5BwAlx3Z7mgNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TgIonKZCJOnP0rhlQEaFWeM81iavDHU7jNDEsq+slF2dka+KaN1JB4GNhvM0uxvgIDYXY9h6asyMruFca9KtLkCQ1AJ4j+yaj5n1qJL2AvhqWWub3tkBEA9x32P+hqET3MW3Uq3Vh0N6Rd2sAY0Su9kmhiyeOM8xH4ugyxovrcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LfhiZ0up; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LfhiZ0up"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27CDAC2BCF6;
	Fri, 31 Jul 2026 05:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785474173;
	bh=0GlR4bJ81KetsUvVTlRU06Cu889JBV5BwAlx3Z7mgNU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LfhiZ0upxRhCuIGZJCnerSqOHyR2w0OABhq2zhTNYfMbDg/eNYRs3d62F4kRa3nES
	 G8Uoh+08n/4//bVRqx2E+AnrjSyPxBVUzvYVh9MMynqS5dW9wk07Y89zeNJ1I24Uls
	 J/xxMw5LLNd8qT7K+DbRwneN2biYAcJcDiRf5B+QO/HG0bXz296MMHO/ZSFz13pTQV
	 poNZpNPFLd4LuUIOgmxJlaXVZTt9fzfa6ukaf1tMFTVXxUpiGP1Bn3yBYi97LqcHGD
	 HiYY4wvv5lw/2jOZ/nxKBB+A23WQZ6pYrxWiVXlgYiT98aWM5kyNAmF+opqdr5O9iv
	 BXnZE9k8syYHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04221C55167;
	Fri, 31 Jul 2026 05:02:53 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Fri, 31 Jul 2026 01:00:08 -0400
Subject: [PATCH v2 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 compatible string for SM8475
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sm8475-pmic-glink-v2-1-28c04928ef22@proton.me>
References: <20260731-sm8475-pmic-glink-v2-0-28c04928ef22@proton.me>
In-Reply-To: <20260731-sm8475-pmic-glink-v2-0-28c04928ef22@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785474171; l=994;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=qlIsWzTJF0ZNZIPSTD3siW5UjKn8TpIMzi3TfROAv2Y=;
 b=UYFWJnnkVXGsAo09+NrRG9PD+O8CBvH2CbNyQPsxTt9hmxpXbPzIS7hoUVy/TpXcvZ+J2nWsR
 dD/ztt1kkhaB4LKX/YgNF2YomCV+sPmUSgP58KOrwA75uWolF5yZflJ
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

Due to a different process design, SM8475 (4 nm) SoC takes things from both
SM8450 (4 LPX) and SM8550 (4 nm) SoCs.
Add a separate compatible string for this SoC to avoid possible confusions.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 16ad4f5698fc..c80c72411381 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -30,6 +30,7 @@ properties:
               - qcom,sc8280xp-pmic-glink
               - qcom,sm8350-pmic-glink
               - qcom,sm8450-pmic-glink
+              - qcom,sm8475-pmic-glink
               - qcom,sm8550-pmic-glink
           - const: qcom,pmic-glink
       - items:

-- 
2.55.0


