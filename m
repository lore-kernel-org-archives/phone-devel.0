Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1F748988B;
	Wed, 29 Jul 2026 19:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785353519; cv=none; b=MzRnWLuiqQM7y5+e2OlSQ8JbTbyAB/HDbldxvnxVMjps8kgs7Mo6ntmIYvYb0xEEYyyGb1wZvuiZ6MPLAkyDNkwmqtfBxcZbzrVSOiS4pB6lRZkXO00pI5MEnXHhH8LMkIiTVARSxGS72JO2xumq9I3Uuo7BnRCU2wh11ZfVAeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785353519; c=relaxed/simple;
	bh=Wf2EtlUeo6FZ4AcnDHaXkXMcOAXWk4X32FUairCCbwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qVEBLppDKqOhKgsj3Fd16cVQGdPoaJEkziydMhG+eYC8Rb1COZdg1Y8nZsHaDXCqldOvy/aNWB/HAYSs8+iZP5YKzCAa4QP6YrwdGS+++X7tveUExH7pRuK2CGGSQYDS7eycbHheCrqjgF9JyZ71ox5x+V/uARZgn2eMepTF5SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEv1Ex8c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEv1Ex8c"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 119D8C2BCB3;
	Wed, 29 Jul 2026 19:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785353518;
	bh=Wf2EtlUeo6FZ4AcnDHaXkXMcOAXWk4X32FUairCCbwU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kEv1Ex8cU/LXiiUoAFxrv1JAOiSnROfgSRT1XQr8axHWHmkLY/uS5qPkOJwbBVEZl
	 BtIrmEURT3GVfiNFPYTggXYoijAru/89SIZvrfEBS7Mv4x6P5c0cB7GzloJiyImmbZ
	 rvtTyZ+P7HAaAGVWAdA5n6xCqnU40T27gPNK6A7VkmSSdE2SqwuHMng6+7LqhYh4QS
	 rpSjk6BCUGiX1O054Ye18qjVPPb9NowuFgJ0TjEQY4m3Iq4uedH0L8i9ov8AMKJMkY
	 EzmlEUMVW3zX/IMB2aDpHWtOjVcW81xWaBz8yoE+OTnA2uRtCN9edtvbe7VYEWaa3E
	 Tdsti3hjFxwAw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C87C54F55;
	Wed, 29 Jul 2026 19:31:57 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Wed, 29 Jul 2026 15:31:55 -0400
Subject: [PATCH 2/2] ASoC: qcom: sc8280xp: Add support for SM8475
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-sm8475-asoc-v1-2-3edad8aa7628@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785353516; l=1427;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=LPNPk32JR+3Yfc6bcAUf5H0iSCn6KrddoUkqE6S79To=;
 b=kqdC7AoaptT1gMKNhyV6c/egWFeHnpURHaXskErHKYgEFEinbXaTeA0+rTKVP8VooK+vVx2wZ
 f44wenZn1N3B1LnzcCNy7ET5vhfCTAVKBJDWcWNgyWReVHZokn3CCzA
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

From: Esteban Urrutia <esteuwu@proton.me>

With this, SM8475 topologies can have their own firmware folder.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 sound/soc/qcom/sc8280xp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index a9304784d41e..f0f3cd8fca38 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -362,6 +362,13 @@ static const struct snd_soc_common sm8450_priv_data = {
 	.wcd_jack = true,
 };
 
+static const struct snd_soc_common sm8475_priv_data = {
+	.driver_name = "sm8475",
+	.dapm_widgets = sc8280xp_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
+	.wcd_jack = true,
+};
+
 static const struct snd_soc_common sm8550_priv_data = {
 	.driver_name = "sm8550",
 	.dapm_widgets = sc8280xp_dapm_widgets,
@@ -395,6 +402,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
 	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
 	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
 	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
+	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
 	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },
 	{ .compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data },
 	{ .compatible = "qcom,sm8750-sndcard", .data = &sm8750_priv_data },

-- 
2.55.0


