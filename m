Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8842B3254AE;
	Tue, 14 Jul 2026 06:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011015; cv=none; b=Yjng81En2NmZRmMCnVQ5W4xUpo2LNRdXg21FoHnI/g5m17a+DmIJ+6mZETqbAiKglKan7VIGGXlC4xoprxBO2wJmk5MloRqEjqTargnWRdfrlnTTmJuu6SLDGfTmMtRp+hwiiRtgrf5i2ILuV0ylxcdqu7+mbzeFtdt1IjAF4Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011015; c=relaxed/simple;
	bh=M5rHWWsk2ebtN6p/G0BoVZWqMTBYIdjkLJ07rqFgImI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FmnWJiZlC9DVVaraqCFFFgNYbopGgHdWTglO9MRcT4ItT4BHWf4DcfbHHtC52jp58NUht/cGE+R/OpJ5awOKckOFlb4eT4sdejlTvQMierTw3399JF1cd2BFgdq73jqsXRDREoIfCw1bNTZO56KyY6jxdm9w1mmmS6uWzf6KiCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8uNhDPf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8uNhDPf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F847C2BCF7;
	Tue, 14 Jul 2026 06:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784011015;
	bh=M5rHWWsk2ebtN6p/G0BoVZWqMTBYIdjkLJ07rqFgImI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=H8uNhDPfLjxRYjAaHl8ppsA29U3sRdpmwYKj8aql5ZMFZHqTYTcm/AIFA7mhDmLd2
	 RCqD84iW6EiV/cayqN95ZBqzAREdsNdRsVL8Znj6FbOHD8jnnTWfsUMxv9LyYxCS+1
	 3j55NJKlXLWjASk8U0fkwGRezvgdceNsaKXBuV52oDLFHLnjFSCBIhuE/h2bONDbFg
	 Z//dGMCrHBtym19gvdBZFtCXGD8+PodFktvuEHoATjfz8hyyBTHNIkMvNdeR/aDmks
	 79Ci40kNLuPwEAr4Viu/yGyBdOhM1f3xrpfr8yFtcqZi3mYmru33Ml+YR3igiljnfM
	 I4V5uwsAKSKSw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339D0C44507;
	Tue, 14 Jul 2026 06:36:55 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Tue, 14 Jul 2026 02:36:40 -0400
Subject: [PATCH 2/6] phy: qcom: qmp-pcie: Add pcs_lane1 offset to V5
 offsets
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-sm8475-bup-v1-2-b2871be2b4ec@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784011013; l=843;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=F5UdqLwC15G2UvXxjasu1py1N0XW4szUwdIBq6LGK4E=;
 b=ukvHRLACirQxzxbOSPAUlwEJxKSXdNkzqU6q+GVamPSQ3lpZuOe5DzquAmqEfaNvWl8yf1oIP
 sFQ68JpJZt7AtJNyt3vGciWQpBB+WnTuLnfQR8W+8tuIRbWVlrZMOjV
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

Some SoCs such as SM8475 write data to registers using this offset,
specifically SW_CTRL2 and MX_CTRL2.
Add pcs_lane1 offset to V5 offsets using the proper offset, otherwise these
registers would be part of RX and would not be defined.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index d3effad7a074..3618812e84d5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3554,6 +3554,7 @@ static const struct qmp_pcie_offsets qmp_pcie_offsets_v5 = {
 	.pcs_misc	= 0x0600,
 	.tx		= 0x0e00,
 	.rx		= 0x1000,
+	.pcs_lane1	= 0x1400,
 	.tx2		= 0x1600,
 	.rx2		= 0x1800,
 };

-- 
2.55.0


