Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1D93C5DDE;
	Wed, 29 Jul 2026 19:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785354538; cv=none; b=ZQOhFdrhNs0S9KagoCf/Zd+TMMbAtG8XAyMrlyHR5uKKZVCppbVNtbBpRtMWaae2umKxj9L9qYa6THd2fvuFdLKi8TFxgX/S2AMfYthsWGLkQ+O4Et8UunvuB+9WFtug7cQV990Y9YrrOWgVHsTqjaqGASOwuSeeag5uDI82XUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785354538; c=relaxed/simple;
	bh=mrj2UMQZt5OK14AodCda13lh3dkmgvVZmAbPJmF6Buw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iu2nKKDkszFvzEm/of1mHIF3wcNuSnSRAvfUuHOUhJcTiuGG6HFR+htyPgPIvkUz+kc9t1MB0K5w4TARzW7ytYf59EMXJMu7can9Zco03YP5uPS8l8f41lerokk7jzv1PkjMWOHoenAF3mwXTTjlACmj7ddnn0m0IeAUMmRnJDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTDRfa1p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTDRfa1p"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99F3EC2BCF7;
	Wed, 29 Jul 2026 19:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785354537;
	bh=mrj2UMQZt5OK14AodCda13lh3dkmgvVZmAbPJmF6Buw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nTDRfa1pPzURr9j5/jJjssgAaduoAsjdSxCKUxYu/VP2Vui8Um5Zif+JrSeZfFsxT
	 slu+M4UvKvm3wHjOihB0PavVMGbWyAzOoEUe+WDZ++aSvEAq/ShPNpSF/VTgBj1vSL
	 8HpnfFIRRFlPdwQlwzbAXfKFU6XnX1D65oybW1Jrs1hRIre3Nqjv+VJ/YCF06l+nSe
	 Xvp51lAYmDMy++nhHVtVah6TyySMGKQEKqXlANPWo1KWStBdTQzLXnNh75Ga9nZYVm
	 1jWUnBHk/pa5GcrZh2V8OJSOPxumcWdz2/Ef4eLhSG2z5hjXJMQ4CmANzQNzU3g2IH
	 SJx6qwlm0XTgw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 747C1C53200;
	Wed, 29 Jul 2026 19:48:57 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Wed, 29 Jul 2026 15:48:24 -0400
Subject: [PATCH 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add
 compatible string for SM8475
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sm8475-pmic-glink-v1-1-c2e1967c04de@proton.me>
References: <20260729-sm8475-pmic-glink-v1-0-c2e1967c04de@proton.me>
In-Reply-To: <20260729-sm8475-pmic-glink-v1-0-c2e1967c04de@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785354535; l=839;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=0RkYfT7rea1utUnMdAEKOGzdpJNp1iGdKhG5L3zAaz0=;
 b=nG9XgR+swDbx10GNYeE0rqt6DsG1HzIXuQw3qvkJLB/hoDC23FkoZxQHaoZ4W5jtDj376FVBf
 rxsybq70HEVDtf/9G4aq4bSuu6G+CuFTsVhUj5q+z3LgJPTMPTLm5bk
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

Add compatible string for pmic-glink.

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


