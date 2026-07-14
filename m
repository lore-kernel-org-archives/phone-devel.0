Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A322137AA95;
	Tue, 14 Jul 2026 06:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011015; cv=none; b=u8Faq6lHZLh9BLSjLiBC/Ff9cGtGcFJ9Dduq/tEm82n6KH5QIZSk3hANinR6+s0N0U7kcH9dn0wDa/RDvzeZXc3R7h3sQUc9ZDGvUHnHMNyOFMcrg+j0uHCAJ4HCrIk6tsX3J35+e9kmw6cGISjbTSUHivlnJuQknkZEbcVIfcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011015; c=relaxed/simple;
	bh=eE76d1JQqEwXOlMK3ZwMoU4LF2A2iHX+muW73XX2laM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tk1KpgLFNGV+h8ovnKFbyFFL6fJNQ4N4fmeRrewAoi0YvonlDGyHei/CLqlA9TKNOtZON7iDEO1HmwPIVU0JB+kCzH3hm4SfJktwvBbNsPTFUhSfjGhOSA1be1WM5WeW9V6MuvnRFu6tRXb9eP99HPIJWIeYUz7i2w9jCOALFS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Khae6BAj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Khae6BAj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D547C2BCFD;
	Tue, 14 Jul 2026 06:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784011015;
	bh=eE76d1JQqEwXOlMK3ZwMoU4LF2A2iHX+muW73XX2laM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Khae6BAjyZ9FOO3NfJGaxhYCn8TYrezIHtk1eEW1BrCmCJvv+UdoUzZfCEBBR8M6G
	 FIFnNORsHs00uCDE+seKLz1GnJ/q6jd+yfMKwk4N6UliraoS5BI1VJzbFWcNmtvf8G
	 Wd2JUCyu88RdFRmRwJyuDlttTZbeukC0eR9aMwBWFUvQPjM1DMSiXXlOoi+wKfZpjd
	 9HwClkh7puPAGdCf6jIo74fpBVmEqkjRYbW0aq38CJ/WGy1TsASWEa6z/Xwffwfwzt
	 6wFFYzxW+92k1ck0we6BBhQSD5U9/P+8q9sD+EWASvqFteIhk4f9CVX68Mo/vlfeyN
	 8jMUrmbpuzRrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 575A3C43458;
	Tue, 14 Jul 2026 06:36:55 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Tue, 14 Jul 2026 02:36:42 -0400
Subject: [PATCH 4/6] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add
 SM8475 QMP PHY
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-sm8475-bup-v1-4-b2871be2b4ec@proton.me>
References: <20260714-sm8475-bup-v1-0-b2871be2b4ec@proton.me>
In-Reply-To: <20260714-sm8475-bup-v1-0-b2871be2b4ec@proton.me>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784011013; l=1034;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=PFP6IUISjVGd8cu9nI1mb8qZCo6FrND8DguB7XWFWvU=;
 b=Knlwubmm3cj+tjfc+xBpN8HYB1V46nzV6q3q+6JzCvyRUeRuUxRW9y10afVId2G8FiX1ImDZ6
 KipU2bPxOM6CpEpyjm4CljVsDSfrZV8o0mJIHoVfVGhl+VcTHijG28d
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

SM8450 init sequence for this PHY varies significantly and can't be used in
SM8475.
Add proper init sequence and bindings for the PHY found in this SoC.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 4eff92343ce4..b9d0de25f43c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,sm8250-qmp-usb3-dp-phy
           - qcom,sm8350-qmp-usb3-dp-phy
           - qcom,sm8450-qmp-usb3-dp-phy
+          - qcom,sm8475-qmp-usb3-dp-phy
           - qcom,sm8550-qmp-usb3-dp-phy
           - qcom,sm8650-qmp-usb3-dp-phy
           - qcom,sm8750-qmp-usb3-dp-phy

-- 
2.55.0


