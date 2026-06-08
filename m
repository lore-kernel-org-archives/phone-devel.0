Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D4F3BE163
	for <phone-devel@vger.kernel.org>; Mon,  8 Jun 2026 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913439; cv=none; b=YACw3fQVGE2GzPM5DjcbwulnUJsCyZO549LlLRQ7y3JuqKB8HaXekXQCu2y3QHOJF8E7xmd2YKkj1dzfiGlBUd8D0cK2Fg19ppngJyG+44E4Zzz5J3JgwgeOH8fCx1gyZpQv2shATQNAy3zdQ4xdYzFT9k5zw6jq//bjbh99LKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913439; c=relaxed/simple;
	bh=6hpTCbdzeo/gi0I81ECZSMINClwYHfHsrmF9DttWUNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YfGKkVIq7e5zHGwnJhasrdWK5I66vxZ9KbtE7TSAiAQIffluo7xzyDvnWfvrhnqp7nUSs3v8lcKJ6lI8Mv2w7JY6WS0WOEBrONKxxuWFIHKMGWNrIIb7gmd4VBf59N8sdNTmMRTeSL3C575NzAFIn5OpmlcMysEIj7Z02JIoahk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvlA71eA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvlA71eA"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b3637b90so34916405e9.3
        for <phone-devel@vger.kernel.org>; Mon, 08 Jun 2026 03:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913437; x=1781518237; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=emvy179z6dJMDrgPyiwVsfcWZgJaGh4YAUAbF2ldsPk=;
        b=kvlA71eAUnVrEzxMNTj2wZVeyJwTMozTS1lBHoYGsZ7kubLbswSvl81di/HC6v7JB0
         7+qdbBBW6VQIFQk4zj6KbPO5qwpRIhLRPII+Lw1nQxNjz8O4GTcIVwFkGjde5zE4zswI
         hldRzYYHTMaBB3ZvZa5VAGHEhqAaqeXT9doCtiGvUDJTd1fHChwKUolgtTk5NwFOnVh7
         98cjGzzfsmBJx5l8srX1j+xeLigejSLkl18Jt+oJr8fOFiQjxEFPv0VGV0h9+2FAKhb4
         DiA0Bb67sDZsa5X5idjGFLpeMHAetyMW/l4orY9wtkFOF9Q+QW4eSTDRRgUMnAdlGY8U
         TV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913437; x=1781518237;
        h=content-transfer-encoding:autocrypt:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=emvy179z6dJMDrgPyiwVsfcWZgJaGh4YAUAbF2ldsPk=;
        b=hG4k1hRCKz+s6HksN1In7lM01cMWU4MfyKCrt7/10h8FcvWBFLRH5lJayV6dLEjL72
         BwnS+FpOAbSiLImzV6IHF9zXKHxoiiL6b9nl2aAlBLVnTKBmnxRcxj0GZc4E5b6hDhUt
         6vA1Q02JcplAhFaB5PoSIu8wfp5DW305yEUEHb026MFUfEQ93fENl3OmaDbPrToEGzdQ
         rwRDw0H9Nv0hiQQqvx4kBB8R3Vet7za29I66U6Et+c+aJbx4AR4NWm60aEYPcqk3zj1c
         wFAMTVgauOm6axkRRPwbr/3FA6bw4s9NzGmWseoT87ijotjoRB/70r4YtbdKAZYqVNLU
         mkAg==
X-Forwarded-Encrypted: i=1; AFNElJ/bnAxQKIvWn3BB0Vj3sXAuTZuxOBOl0oSdC90/DqHAeI3qxYavNJNzrLcYVgjJKV3bqi0C4iJwiLWmpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPfqCvcG5jflrfvXps20aJHBQl8Sn4qiANJGUn0jkBBW2tItt2
	hgpZrw3YXrzLJnyaS5D3K/bHByTX2d3WAtUwc1a14VqzErTXfMq05782
X-Gm-Gg: Acq92OE3yPoWYkHcneY2R8dcz7EkFElZFe9qdsBFjrCk8KTTHgZ+pjlR6ogb3R9N4YP
	Xslx7fY45+1dv94+Jh5xc4ro4pDBN4L35GB7YCN8aKh8dWgj1UcFanLq02aR50wo22BAf+n1lRv
	i1iGpslI2fP8Q+7L+vFX7e507cQp1OaSGChfq81DVGQMZYKyY1tytLcEHHwBD04Q0HmQEstBQGv
	D9/xU3IGLnUs3I94ww0FctQN0f5FgGxaKYJTSbFKolOO+rMongyfvihagbm2RdAI7jLC7Jfj0YW
	cG9L34O3awHSNkbY6ElkG1hTxRk4OBjustrBYu652dq2Aqfyzn6MR5/gUoUuN9Gwuo5qR4p21MQ
	98OD1a9d7boNkJ18Tpwnw2wY51RPGHBnQyT7qGXYvnsi6L86drzUXmmZIA7d7hW1AWt9T3mIEuG
	p11NdbckmnuCWuvGliV3raWnCkE0WR+epxTdbQa4yvINq9Y2Gcv+I1SvIpT3rqg2Q5X2eX1735N
	mWjdaAM8vyIt3lqqqmYY26VlvEYPsH0+n7+/QNet4c=
X-Received: by 2002:a05:600c:45d1:b0:490:b9c3:6c62 with SMTP id 5b1f17b1804b1-490c261007dmr239801185e9.28.1780913436730;
        Mon, 08 Jun 2026 03:10:36 -0700 (PDT)
Received: from radijator.localnet (93-143-176-63.adsl.net.t-com.hr. [93.143.176.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b59f0sm445526375e9.2.2026.06.08.03.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:10:36 -0700 (PDT)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <dujemihanovic32@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] mfd: 88pm886: Initialize battery page
Date: Mon, 08 Jun 2026 12:10:34 +0200
Message-ID: <ZyFElwT1QjOADA-7NXdGRw@gmail.com>
In-Reply-To: <20260608085524.GG4151951@google.com>
References:
 <20260526-88pm886-vbus-v1-0-f2bd1fd3c19e@dujemihanovic.xyz>
 <uME6Hy8mQeKxnZAg1Q4aPA@gmail.com> <20260608085524.GG4151951@google.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Autocrypt: addr=dujemihanovic32@gmail.com;
 keydata=
 mDMEabRVUBYJKwYBBAHaRw8BAQdAG5VJBpoPRIGQml4+E2LcPdyVtnXRuuqoD1BsHxRjNQ60KER
 1amUgTWloYW5vdmnEhyA8ZHVqZUBkdWplbWloYW5vdmljLnh5ej6ImQQTFgoAQRYhBJvUYwF2kA
 idqo3CZidfVEs7G0eSBQJptFVQAhsDBQkFo5qABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAA
 AoJECdfVEs7G0eStq0A/1SDcm8Bkq1JV+GTGMC8qE1QzCFvnoJuZqtUuQRCkd31AP9Mbc3pmg1K
 JDxgPl17/CQohZ98dbUVffmdQpJJLLMsArgzBGm0VXYWCSsGAQQB2kcPAQEHQH8nnS6QNfgpc1Y
 tqU80DWMWMsDPEGJ7yZ9Nf90mPEEQiPUEGBYKACYWIQSb1GMBdpAInaqNwmYnX1RLOxtHkgUCab
 RVdgIbAgUJBaOagACBCRAnX1RLOxtHknYgBBkWCgAdFiEEA6Ue0g5lV5FAcj1ivjIt18NZWcUFA
 mm0VXYACgkQvjIt18NZWcUyDwEA5OK1WRFN4/psOq/bS6Wuh5ysy0CyXIydqIwDJDdAFukA+wfc
 lr1qyAbEX0FHVunCl+sxv/ymvjsup85rAH+a2j8HA7gBAIolabvAIUTUfCQNCu5MUt482b2EC8K
 40xl/6HT43dunAQCqxwRLI2k0xmTdia2AZwqbbMvqWonOLWtdZwWvodgjBLg4BGm0VaASCisGAQ
 QBl1UBBQEBB0CoqkQL2R15WHRvj3RlkxjW3pPpZVUOHyfhEX+Q9PhTcwMBCAeIfgQYFgoAJhYhB
 JvUYwF2kAidqo3CZidfVEs7G0eSBQJptFWgAhsMBQkFo5qAAAoJECdfVEs7G0eSnB0A/3oyRxS5
 cUJMNnM1+4UkRahmU5/42NfVOxIL5d5oaW13AQD617LpOfnCuZR3U0vHLOW5vrnFtdvi32N5zLD
 9wyShC7gzBGm0VbYWCSsGAQQB2kcPAQEHQPRL1mWe9nIhjicyAqqEN80IXEF0NeKSFFpN8n75b2
 YIiH4EGBYKACYWIQSb1GMBdpAInaqNwmYnX1RLOxtHkgUCabRVtgIbIAUJBaOagAAKCRAnX1RLO
 xtHktyGAQCJPD6JsQhQZEB8ciZrJz+hnonsJp+KZZQQGEK/KsLHEgD/ePz/x0pQdI/DcJd/5Qge
 +IJGd+jyv4zyevPxipVbyAo=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday, 8 June 2026 10:55:24 Central European Summer Time Lee Jones wrot=
e:
> On Sun, 07 Jun 2026, Duje Mihanovi=C4=87 wrote:

[...]

> > Lee, do you by chance know how to proceed here?
>=20
> You can move them.
>=20
> Please take into consideration data-size as well, rather than blindly
> following RCT.  Larger items (structs) at the top down to smaller (ints
> and bools) as the bottom.  Luckily the larger (data size) items also end
> up being longer (string).

Am I to consider the sizes of the pointers or the structs they point to?

Regards,
=2D-
Duje


