Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E59248F57;
	Sun,  9 Aug 2026 16:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786294140; cv=none; b=cCbN1s3/otafEpQyEzXKfrDUYW8LGTcVrWUUCfSW3/9h7pJ30CzwU+paoLG1cT8+kUEXM6jnBtiAquIspV7bNR5+hzP1bir+JWb/3IpIkkXTEfkrXa0q14VoeVAinTB/kuMGxjmq/9BrN69WouQnEmyA/CGV+u1vWyJxvUXuZvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786294140; c=relaxed/simple;
	bh=n7q/MgBvbnMsu9AL/8ahzd4dEQ8bPRYl6YKmNV4Q/YQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=owX7pJYASNDwbjNMXRENCpcHLVVXfGctA55CRyQcRue70in1uE3nK6fVM8+V93tfTKkHiNIei9/R2zIYk5jKXfCKvBYCNJJd4T91GGXwuh8ujQxBspXhEkTFe7lBz6nx2udYWlzjNOwupQCkcxSm3oxONNR+gF+0gYHQtK0USTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pkAJXfJO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pkAJXfJO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B8C1C2BCF7;
	Sun,  9 Aug 2026 16:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786294139;
	bh=n7q/MgBvbnMsu9AL/8ahzd4dEQ8bPRYl6YKmNV4Q/YQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pkAJXfJOh594I23Sf8ZrjDsN8aPoV99JpzG4C3x64zdK9bSXbh/sLWGodRWwD+236
	 AZDeY2MF95knXSmjl4xzhP0mh+DZrDonvp9iHbdMsTxIMRPhz2QtL2PapcoLQNv3F8
	 l6K9lQFO3B33JNzWIVBCLnddhRLjDpvdC8sUor8/7Mh0hGzWunOpEtIY5OT78vBHqx
	 eWa7Fq7HAobC/Riu/kHdh3+KiwkLLnn5ThsP2yaWI/plkMhreIcO0DfkLRMWxJzIms
	 oIqA2vOaz09T/sIRvQnjTvpyR89W/xlWrbZCJbsfKcUFboDhfthEeHA149HRN4oj/Z
	 vGyv22gwj8/Pw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC51C5AD4E;
	Sun,  9 Aug 2026 16:48:59 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 09 Aug 2026 18:48:54 +0200
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Xiaomi Mi 8 family
 compatibles
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-dipper-v1-1-eb4d501e85df@ixit.cz>
References: <20260809-dipper-v1-0-eb4d501e85df@ixit.cz>
In-Reply-To: <20260809-dipper-v1-0-eb4d501e85df@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=/Ll77Db7EYel11IohG9BeTICteMQOe9RQFJs36K0wIc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqeK95dVXr0NeM4PpqgrRa1D0bkG3N3FuxCP1Qj
 rq43LOwXKGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaniveQAKCRBgAj/E00kg
 ctXKD/wKNo+UCUc1oocYQcm1iyAy8EPbWC1bzIcUlTXXm30JJawwiyUFimqvZzSZtOthmnTdShj
 909X9AFwvRAhzmsJDj8UaG2A6ZIO6Ti223jt49DKPdmBo9yP9jNApYDiomJ+kxMOzsmqFI77R8d
 MnftaSk+9Y8wuj8X288zf2nxPMnI9M8RR7Bo/FV+08bYe8d4g36EC8LiNYy+sASr4Cgqtth4Mzi
 xxtAy+fD/aJEibQyMMlt3zzVfM1vKWmDovPubBpxcJvOPzZlbEkSl6+7RCkv2tvMAWLqA+cCrKK
 jGrc2nCdqsLIphRaCdzFgbmUCiO+K0MufP4+45ESC/f0mXOiTr8RgZu6MdWaxqYt0o9odaDQud+
 V7J2iwltYhLA2aThAF7hkdFqO9JTmW10xVpNfWRdmfJwVpkv7aJd7H+sQl7E3frxSBWfZunxKbE
 sBRHrXBdMgKvlqMva1PzkvFySkIXw9vK5ucHwF8KYBm0HMEPXqa52XSvzu0YB4NmKA0Nospt8rI
 iYmGonGJcIKu6R/yUVB3UMZ+aDfxyYXEZA27dIMLLlI/FYyZ+Wx58YZHU0reRdyl1BGzjzTPZw0
 lkKENcI7JouLcYhOXGYeyG5abfA9g8Cs9UbBv+4qqtn/C4Vy9EB/wmR9YsAiXzSt14l1pL+f6x4
 VkebCEm1DBxz4YQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

This smartphone codenamed dipper is now supported by this series,
variants such as ursa and equuleus just documented.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index c7c9a92796846..5a43d480fd999 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -944,16 +944,25 @@ properties:
           - const: qcom,sdm670
 
       - items:
           - enum:
               - google,bonito-tianma
           - const: google,bonito
           - const: qcom,sdm670
 
+      - description: Xiaomi Mi 8 family
+        items:
+          - enum:
+              - xiaomi,dipper
+              - xiaomi,equuleus
+              - xiaomi,ursa
+          - const: xiaomi,dipper-common
+          - const: qcom,sdm845
+
       - description: Xiaomi Poco F1
         items:
           - enum:
               - xiaomi,beryllium-ebbg
               - xiaomi,beryllium-tianma
           - const: xiaomi,beryllium
           - const: qcom,sdm845
 
@@ -970,16 +979,17 @@ properties:
               - qcom,sdm845-mtp
               - shift,axolotl
               - samsung,starqltechn
               - samsung,w737
               - sony,akari-row
               - sony,akatsuki-row
               - sony,apollo-row
               - thundercomm,db845c
+              - xiaomi,dipper
               - xiaomi,polaris
           - const: qcom,sdm845
 
       - items:
           - enum:
               - qcom,shikra-cqm-evk
           - const: qcom,shikra-cqm-som
           - const: qcom,shikra

-- 
2.55.0


