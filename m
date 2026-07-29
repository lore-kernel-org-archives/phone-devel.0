Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01F43C7DEB;
	Wed, 29 Jul 2026 19:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785354538; cv=none; b=pQBuhI3yTVdz3ulko9JOSpDGhJKq1o2E6ZwUZci/WBxe0tHXtM/gY9abQLniD4e01eMusWvWyndqARsn6vUVKL2sEHy7On629gU2BeZJM01FDsbwVYkW9vcBdOj2rE+sx/H5OWCduQJV1ixzUyKuOdxkd3jMBlc7pVu09Zz/L84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785354538; c=relaxed/simple;
	bh=MorjAIRdTFfW3W2hi54MeLO5JqjT8bKkciT5vCaQRzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h1CuZZoPVZfXwZF/Rq4dgyKfh40r/iReF++6OEh2a+s167opNU5pkhHP9B7QFdBZhp+ytzhe+418KlPT19JEANZlu78o0mKjsbj8ef5ZfqTa7VIGmr1qSC2GG8OSPe4Qw0AYcaCtENqC2qRZlCr3gc8yR40jh+mCnpf7LNHQbHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1nzKHT+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1nzKHT+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8B6FC2BCFC;
	Wed, 29 Jul 2026 19:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785354537;
	bh=MorjAIRdTFfW3W2hi54MeLO5JqjT8bKkciT5vCaQRzg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k1nzKHT+lf1Br2DwrmABx/eArE5kU6fefZStEajDSPWM6S0JfiBLnZCquFyQL54Ow
	 QJYrKHfFQRUoZcjxC+oC9+TZc2UA20d5rCIRbtVXGGPEOnXq8BYn/v6KueoNoY2Zya
	 oWO0Bgw+8WD06i7g6oc6rYAzgZ2piMJVyxjQ5iy/xyZILBpx8Hx+kr6EyduYgdRisz
	 MaG91N7JrKc85oQ7kDqNhfmCJFEzMInnenkqGB+9OZK7ZouLbE1gGPGZmX0gZFrGE6
	 TgfEJHds5M0n9HYeY8ys1/9YLXw0ohd4pZx74+lPGz/FLU1F7mvi3kBa8jr0h6frc7
	 Q/A97+iPZecOA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 851A9C54FD2;
	Wed, 29 Jul 2026 19:48:57 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Wed, 29 Jul 2026 15:48:25 -0400
Subject: [PATCH 2/2] usb: typec: ucsi: ucsi_glink: Add compatible string
 for SM8475
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sm8475-pmic-glink-v1-2-c2e1967c04de@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785354535; l=934;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=+6ks2/+OdDNHqyb0BrFzugSZ1v5//mlteIvw/LIgXIg=;
 b=bFtxRosoMKs1lORTnCjj6YLrrWGcMPeyGK3NziC+is5nHh6cDYakxFDXufZOIdPRLqmKLJD2k
 YlKmsf2ihBKB0WYamXqUbumZrtiNb8RI488EcU6Qjx3K6Ff6kwICwf7
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
 drivers/usb/typec/ucsi/ucsi_glink.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 12e07b9fe622..78a0ea349ed4 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -381,6 +381,7 @@ static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
 	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = &quirk_sc8280xp, },
 	{ .compatible = "qcom,sm8350-pmic-glink", .data = &quirk_sc8180x, },
 	{ .compatible = "qcom,sm8450-pmic-glink", .data = &quirk_sm8450, },
+	{ .compatible = "qcom,sm8475-pmic-glink", .data = &quirk_sm8450, },
 	{ .compatible = "qcom,sm8550-pmic-glink", .data = &quirk_sm8450, },
 	{ .compatible = "qcom,x1e80100-pmic-glink", .data = &quirk_x1e80100, },
 	{}

-- 
2.55.0


