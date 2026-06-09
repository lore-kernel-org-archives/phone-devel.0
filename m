Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64D541B347
	for <phone-devel@vger.kernel.org>; Tue,  9 Jun 2026 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009362; cv=none; b=mi1vDoxCMFy35Mlx5pcOBm2hhfy61gyVH4iZsFoYoR8YNG8MmZp1TljaSVy2YGij6BJaKnW8hlnm/k1v4VnhDuwW+9iQRj6HJts1f9YGyqNoyC0Pn0oxwhdt7nRlrrea4z8HQXCCZkp2y1YYN15HUUZOMcyTuY6bCxaoGDq72zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009362; c=relaxed/simple;
	bh=s2QGb4y40sLANF+3OJCVwflwcaE2JULXAWEed2gyEzM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HnlMT+ZvM6Wa6lvapUXzFcqLkofwSWFjsHTyi3CpXtVGdBgPu/twlasS9szwRKlIj8lQ3M7SMTo9MRHzAldjJIybwQZOw+ctuoZR2phi7qsqQyt0NBzQrZ4IN0dAK61l+O1tGg0VEVndUzx7lIjNpxkvWSAY5Knq53WlxkaYWDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EPqUIze4; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EPqUIze4"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6913fb25322so4153050a12.1
        for <phone-devel@vger.kernel.org>; Tue, 09 Jun 2026 05:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781009359; x=1781614159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ES6fdPS+lsBWpcctKzeQLWtyfchFEkLlvc6FkKjHN2M=;
        b=EPqUIze4iaNeI35rnzUwZEL1rtq2r9EAYJC8x15K7aw5KiUWPMFvcbOXfxJxmUy3dR
         /OjVChQKxML9xuB5Bj0s/zw9yTL9uBBearGKeCpiviuzMdt7dNXxHbK7u76lRkShaZ9+
         BMEukTXFx0+N+0+ZcMtsCpyIV+m5fY3iWgRnhTd/ohiBJYwnKjk4cwHcqQVW7wQeVAnF
         fHMoGvgUrP1bFFb9abSkPHM/FxW3zp6Ju/QDAz9oapQmcj8qckoGNYSAYKUmB004d51T
         ZA2p0N0ONdfIYJOkSSJmNy1wGzJDKARuyGf0s1hZna0erA2fqvZC3SaSkN61Gbn4BKIt
         CB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009359; x=1781614159;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ES6fdPS+lsBWpcctKzeQLWtyfchFEkLlvc6FkKjHN2M=;
        b=efNqtN9E9QWWOA/EbtHrorR87yhy1SyAg5RtuREuFNR2gEboF2RBj9XQilfBp2osQu
         bd8/myyEEnm6XMqch4rq++s+vlIGDITJ1eNve0xLvnS6bPb7rE028r8satZsSReXZKND
         FR/VaLEGP/aJZ4QnDNWOwxmHECg4VQIr/zIcx0gp9uW5PXbYZh5yRS6uDj2q5FnOHz5V
         eLKvkf/tJazfIXv15SXSqfl6zVkDtBkougZcE88XUW60J5L2NmboXnHOgGMork0sEZqK
         zgjyPe7+IACC2LDnwgWjLl8FYRD/R1Y0aARs9tzn8G2XAmnmmxLFhwvt3Inj55E+w2jb
         /MQw==
X-Forwarded-Encrypted: i=1; AFNElJ+7xQUCS0z6bwVaPMEchFqo0Zm+qScNh/G1XzaedIlcrs+xCOI4C7+z8jKPERXUo64ebip9dCVdwQ8e5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFJ8tO4yyQKsELn0sqh3Bjaxs/7Lo8qzBRaRjiQIY5chb8uv1/
	06Mg2nuXMl+NLSzOFXqjqBpBfc5kzVjo5KWBzYyBVVLciJWSkfkFel7YJ7LfwRse7ZA=
X-Gm-Gg: Acq92OG94Ulv/gE7XbIH8/Eg/+AcaCAUxWraGekHWOVu6Pfqt26UbabgoHt1Fz58u+D
	qUy44/Tay6LqbN6vHHUlJbRk5fwtV+tstyh3wkK6unV0501syKtF+1OhLS4VL78mfs6G+VFVKS3
	kcuYLWXZnylTNZ6BZrZNis4ygULuIKKvvbNSgcNH/G7It+QiR/gO/Z6mXfOuvfTsvzrKyWqGtky
	vxnpMwhbRBAO0NEbpCNY911hRLC1BGODUu5ABi/RiE8o/rN/EccSv/Uszn9CsRcHM+fyx+8SG+m
	IYUftZ8GE6egTWemirBIfegJEUl/BI/DYTcqllVKxtjNBMKTYksQJjuLZibmaFMR8nG3fJNVcCz
	sG+SB/qzjQWz8UXQk1Zbxlbg5H7+144YZEqxC9OW/Y50bTRMigfW2G67NJnNNTQvQm6byYUqGcS
	hhe7X/kMrHMqyhzI5/Ejwa6s5F4gdPpa9ggIbP1gT3VARbUSz8yvQ1N5ALE28GnjjSReLJFYqSO
	NxK
X-Received: by 2002:a05:6402:4344:b0:691:af08:a9fd with SMTP id 4fb4d7f45d1cf-691af08b98fmr4895334a12.11.1781009358979;
        Tue, 09 Jun 2026 05:49:18 -0700 (PDT)
Received: from lion.localdomain (p5b29e032.dip0.t-ipconnect.de. [91.41.224.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b55d81sm8689526a12.27.2026.06.09.05.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:49:18 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
To: Sumit Garg <sumit.garg@kernel.org>, u-boot-qcom@groups.io, 
 u-boot@lists.denx.de, Petr Hodina <petr.hodina@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Tom Rini <trini@konsulko.com>, Rui Miguel Silva <rui.silva@linaro.org>, 
 phone-devel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 David Wronek <david.wronek@mainlining.org>, 
 Jens Reidel <adrian@mainlining.org>
In-Reply-To: <20260605-qcom-gpio-v2-1-c34093041c66@protonmail.com>
References: <20260605-qcom-gpio-v2-1-c34093041c66@protonmail.com>
Subject: Re: [PATCH v2] gpio: qcom_spmi_gpio: move PM8998 GPIO from legacy
 pmic driver
Message-Id: <178100935799.3342853.7861840004609212943.b4-ty@b4>
Date: Tue, 09 Jun 2026 14:49:17 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Fri, 05 Jun 2026 17:09:07 +0200, Petr Hodina wrote:
> Move the "qcom,pm8998-gpio" compatible from the legacy driver
> qcom_pmic_gpio.c to qcom_spmi_gpio.c. Enables on PM8998-based boards
> (sdm845: SHIFT 6mq, Pixel 3, OnePlus 6, Poco F1, Sony Xperia Akatsuki)
> the Volume UP gpio-key.

Applied, thanks!

[1/1] gpio: qcom_spmi_gpio: move PM8998 GPIO from legacy pmic driver
      https://source.denx.de/u-boot/custodians/u-boot-snapdragon/-/commit/6e522e428575

Best regards,
-- 
// Casey (she/they)


