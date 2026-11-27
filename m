Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795804781;
	b=w0KHMvgkms6Cufo8k3M78ld5AVtDeMdiZ7C+1PgAzQnK/G/WTd5Cg37VolLWTk8LlBjj
	 LjjDLXXfi333VSdTVPJG3lclW7s6FkMRUXYQViPaNMKMfztnHdKbkfhFp15MmXH/GcwKm
	 cqql9h4x54W1CYdccawt+0vpu2Falb77XMU8EQvkTDkYdOmt3rVn9CJuXWdXYStnNLlNH
	 STT3za04BRd78KGvxkfkAhjTgYX5SFP+ExzRoCkadCNIXzRHOsWzsgEUy3EPLQhQ8LbMF
	 KQ2ZtKXcA3VCLwpdGAKLgmcl4iMh1RquI7YfaktXRS6GpdQjuYcqMxyqxF+6e397FIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804781;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VBLBaZZy77oZ2WH9kVOPCsjBsXe8rDf/vkV8C+2QWiE=;
	b=qhkLeIKDd+/r2Ian8PDqelve1j8uFqkLi56OsVjTfnAhIJefiquh1xY+q3kdY9HHjkty
	 p5objt9ehhiMO4ZbR5xECRyjoCdVk4LPQBFTH0wyMqoRSa7ESCx8cisCbkTZm+S3QtnCy
	 FC9LfGm8PUI8hzf0KWIpDeN5PzheLuiB8E/gC1cnRJf7EnphnbAO0EcAj1WgNzWcXlyM1
	 Ma+rQQXP9lPvw+KX028rgf3IV1oJSrnDhfGhxU4eqNbSFeFzTW3T2MZmiUfXfaxH2317L
	 ncA/IX1JolAR8oETeIEXGgbwY4PU+zZFbQ1QS5vvOdQV2Luz2/JWzCKu1TxkZylTTnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D9VLYsLd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A516160A2624;
	Fri, 27 Nov 2026 18:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D9VLYsLd
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795804781;
	b=1uOI4aaIe194+zzjk50c31f5uD621OFi3YYLw6ErGTpADIGfQ34d5YtFZH8I8lqipZ+/
	 380wmceXjk0XOLfY3gMV4lDx4PmWAw0uR/tiCig9tMUkdnttaaGlf6VmNyh7ZaWgcmLWD
	 g+82AD1kc24445HZkd5ytLeROF0zi5yZrvb/8bodMDUKg9hXtGEFCFHmDHCoghlYN/qMW
	 yMEQ4Guny3K00kUw5vdr7PoxIPNs53f+yxIqP5mOFckZbFLnJ/AjtUHom2uZUym/qJTFe
	 9sjkO3NjJTGZKeIkRX9bgvN3BXnRx/r+Ifsb5dkrElpvwM62bTw5wHhQICVbWLQP1hg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795804781;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VBLBaZZy77oZ2WH9kVOPCsjBsXe8rDf/vkV8C+2QWiE=;
	b=1Wpza7tSiGkBV3SvyufWDyL9WJA3hJw6pIfCmfQSuqyOUn06msY7ZOrnE43jodb/RTid
	 EWrHA8Pr/FSEp7jvreS5lOuf3w7JiLneh0KQ6QHgOz8F2qj44TkTiQFhlh1O0Mys2eLBp
	 7rGBiD/IKcCs2Q4m8aLBx2OKI1EdgSS4zPwGjbgZ0U7O6+atXV+/9fha6QNPmff7OhpAL
	 y8h2DuAmfAlQ2QLkqHPGegLP5gqmKFaIXM7WdAT32xLnAFQFwav7csMSHcTVyiE/U+tmW
	 gqgNI6VbWfTWq01HlzNwGWIMWviGLbte3uqRK2l97h3xwQYa1HqeUeoHf4KccKka0cQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ACAFB1F00919;
	Fri, 27 Nov 2026 18:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804781;
	bh=VBLBaZZy77oZ2WH9kVOPCsjBsXe8rDf/vkV8C+2QWiE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=D9VLYsLd53BGIR68hPEAK6fjC8wPVyQXfjlcKAIWHjO0SFYZ8iES9n2uoMiqI4UFF
	 NhrdR/x6NVR4iOqzA0/NNXp3z0SfWbRy3zhUBhrkhL4PQwVispSoF33LLj4zYsfml0
	 ptFtW7P2z7r9yaD6q3x1/dB7SAhyRYfRxQDJZ3/9QKXiwjwMkOGUIa/i2x/JoihZYH
	 bqsDBp/CWhC0i/CVPh3TfJ36vT7TfWa4NKv+QcdHhH1rIIpqzJG0RyNC+AQ+nmR/b0
	 d2ecDkJKG5ZUzN1ajUSuI/sjiwYxPyVRAOEmc/FWs58s3EszR9UplxO4NFLDRXIpdg
	 gaCL9U8PR0W2g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 139684DD3B;
	Fri, 27 Nov 2026 18:39:25 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Sat, 28 Nov 2026 00:09:25 +0530
Subject: [PATCH v5 05/11] soc: qcom: pd-mapper: Add support for Molokai
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
Message-Id: <20261128-molokai-soc-v5-5-144801dfad7f@yahoo.com>
References: <20261128-molokai-soc-v5-0-144801dfad7f@yahoo.com>
In-Reply-To: <20261128-molokai-soc-v5-0-144801dfad7f@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795804762; l=943;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=IcJGBEFFIC1fLAxUDNSIKti4IwQ+MXiiJO13Sm2gbVs=;
 b=uPRIRB+jFRudwva2MdpGYA0HM+mxWGcRdyF760z/c1YyFq9YniekVTv1/PBZiNnigFfrMa0Bt
 OhK8FVsmKcUDucVr82cDRFEKkpp0zQdtKBzEpdqAdkUggLX/3XO+mBK
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Molokai (SM8845) has the same remoteproc protection domains as Kaanapali.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index e38647f3d7fd..b7800d4f8370 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -634,6 +634,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,kaanapali", .data = kaanapali_domains, },
 	{ .compatible = "qcom,mahua", .data = glymur_domains, },
 	{ .compatible = "qcom,milos", .data = sm8550_domains, },
+	{ .compatible = "qcom,molokai", .data = kaanapali_domains, },
 	{ .compatible = "qcom,msm8226", .data = NULL, },
 	{ .compatible = "qcom,msm8909", .data = NULL, },
 	{ .compatible = "qcom,msm8916", .data = NULL, },

-- 
2.56.1


