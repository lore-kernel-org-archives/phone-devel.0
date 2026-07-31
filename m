Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7FF14A60F;
	Fri, 31 Jul 2026 05:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785474173; cv=none; b=rawFqGvfgq0Cu7MBZiSnJI2mRK7YOlmYttQtQMk/rhxaVAXWC9dqP4aQdf1QXx/9nLxTh97Nu80zR/zW5pmxoRwLa4amvQ7Z0vHx8skFL8u/gjQ28mEFs8RC2JjX30QF7Rk9OfCD4xKJYYAH6cpG/qtHkkvFcrJY+m3YqYEBtpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785474173; c=relaxed/simple;
	bh=2iuayaqWUwlO/9deu7Aql2nez21xo4uqXS8AOv72LGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gUUxLSyc+GiIZejoYZIuoNZ9z/zqWeQnuNRVhB9oUTp8uPXz8jb94xBUWyvQiRqdG5hzLICYOXoC7WcPKupBJfKxKJ/eoueTCcNzKVPN4yBQVxMdYnGEWjNXFnyv+0x236yEvsdlJ4mdycBvCMec4wNyn6k+77aMrsUNtv1RRbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOB6+Vtv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOB6+Vtv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3836AC2BCF5;
	Fri, 31 Jul 2026 05:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785474173;
	bh=2iuayaqWUwlO/9deu7Aql2nez21xo4uqXS8AOv72LGg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YOB6+VtvtuUvmwiQu2xJqXBjPf11lJO1rA8YpJkJf4b9kr+Y3WMrPLyEBpT0FOizk
	 YUPGojDMOklY/yOl8WjogVKwdwWtbR4XKawcGjxpREHdCkLDcEwn1o67EF2faexRJp
	 FLgEzbztdPdlbbpkvVf+5yvpkeGu1eqjnsGK/63IXH8kC7h/foacma8A1cCKxA+cqb
	 9EPQNmNpHQODE4Vdo4Q7rAmMey/v00+NpkqML8D+VpfzkhDJIZz+zq/UD5o5XW77zZ
	 MRS30VD/3Q+3lKsHWiR/tWseUrWlhpPzKR18GuSzlg7J3TwgVhYBiXz+P64LNQO2qB
	 bJb1xwLAKLIAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12965C54F54;
	Fri, 31 Jul 2026 05:02:53 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Fri, 31 Jul 2026 01:00:09 -0400
Subject: [PATCH v2 2/2] usb: typec: ucsi: ucsi_glink: Add compatible string
 for SM8475
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sm8475-pmic-glink-v2-2-28c04928ef22@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785474171; l=998;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=sd0MJRnY8fTZ1DfMoMimnK+7cETQL/NR6zUIxPB5jeQ=;
 b=eDroRVFNMFxKPR7g4qEz2Y1nWeGk7HqbWZeV5YABNGgp3y7DOBqhaOAgESwYdMYe4fQ0g+Crw
 l9i80FsgchHBrCwtmU6v1LYJm7vYasjukUYLFLWtXhjPp/wpXSuz4F8
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

Add compatible string for the PMIC GLINK service running on the coprocessor
found in the SM8475 SoC.

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


