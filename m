Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612CA28A1DD
	for <phone-devel@vger.kernel.org>; Wed, 16 Jul 2025 07:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752650150; cv=none; b=B96Pg/LenGb/i0uf023ndLO+wz1NFAeVcQHsC7E55zvmg4YQ5Sh0K9FKB97MsT0LyIGEwvKS3hKclVf1SlB19quPFL8gohTpYbaFSW0DbpjZ9VzopjGjbm0BYRNG5yCN/kjlYngYl3a3EwWsgcBCgBueLDSDphYfLFmxc3wicwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752650150; c=relaxed/simple;
	bh=24Tb/LcZcpuEpFKIVKeMZB7NBtNKQTvEKsUhXdnCMXk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=M9wJyHJds/2yGijgwwEGMdGd8yYlNdL5szR4LYiZPDKeQvqX9YQZx2Iknpu1efles2HndY8AV9IXcNZYu0ePPkL2OkP8pJvek6NueL1d+iCjU4WlaSyIAijaaidPGKlgOEdbBzJgt9ucdpe9roWPmfWmPp7+zrb9FkqyVsIhkYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hBxU0FI6; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hBxU0FI6"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60780d74c85so9199764a12.2
        for <phone-devel@vger.kernel.org>; Wed, 16 Jul 2025 00:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752650146; x=1753254946; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfsjryOJJcheH9NBkSyCY8ER+5hEKLpu3+/ZdvPKIxw=;
        b=hBxU0FI6N4QyvB9ewq8YRKB58MORaqNgkMrhXYVmffHaIufzTUqBkT5pO9I8Vk7sVE
         72DJEvKxWuMuruygEKXhPttCZprFXvvhq/onoRMHK+fYnYSdR6nPotsCmeUcjpu33+bd
         SW28QC5rr8OhHWCFj3WjkAJEGVQuEzcaVWEhBawOZVZlR+TlMUybSl/eA9k/dkb7sQRp
         vyD6PszlSyymICoMdafqoXUgi8embFU2wiMtp/1pOQPcBf2u9Tk23JVIss5JvzxQV6mt
         KJUfr4UHgNhJfILhy5Y8HbMlMt+GiPBTPhOc2IfkdHjiCHrZcmqSCCKB6RzVlswHxfOU
         Elyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752650146; x=1753254946;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YfsjryOJJcheH9NBkSyCY8ER+5hEKLpu3+/ZdvPKIxw=;
        b=ra7mSnpz3mTmrGTvNxd5HN6PoqrPaqbs1YCi+qD4wHx8vxfS5+Oo3DzIdoZkbZ17bR
         TwfEAUhb6Lj4YgPJnCfqbZyO07m5nKVusS8yeDh9UhivlIGipMbQDcUHiWLLbRe+A7fE
         5YPCqkc7zfj9BAXdMrRCNKGSW3aXsfdvpWv/CFuns6/7+3MdF35B2lM/PE0H/8AWeXK9
         QgwrU92+WRmSaW7RsXlQzNLvdhztS6kLgoXT4hojgMil3yFO9o5F59FpiXzU63njRy8U
         i21eP7+frePm1mcxRQyayLC4lAD01C6gFoE0c+wqZcIydp8UVXHkTCjgRL+AohG8ORyR
         p+AA==
X-Forwarded-Encrypted: i=1; AJvYcCWxi5rIpO+gQHygYaQyGlIKdfwCrMSnuJrfvRjAxe85GdalgoIvKRxSO12Yzl+wkT5hCFOuhH4B0Ra/ag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/VQrtcbmGHcV00rTM1E9yzghTcc2R90z+6cWA9OQ8vtp9K9lV
	gVKvjKy8nT0WthHOzfU4IC7Ilu2FXnlz4pj8aKJzNOcniNMdaBfE8+NnVTShVLjy66w=
X-Gm-Gg: ASbGncv/s+1kTNDXjjTQb/0yKWXC2b3VvHU4hLodRh58aElRrkOjsyPh3EnCzafzxrA
	SLiLQSDn1q9mFnqsQaMaCE5OIp99rXcsI2H7Sdgsf38t9U/NL7/geaETJDYMJgM3JzcjEzfytn4
	FHFSj+Wbg1uIjqiQxbJYg/l8p7bauxHaNqyX5z8pfM3qffLyZCbv9jGAlkd20bXI+sdZoOaQWMs
	sJ8v1IxZTLW2xmKAMiFs0X5GgIj4n/OGbNYGUK0xcKGwJhwwN0IdzqeyTler/Rwk7ShYalRVoWg
	RkeRTZ6ckvvXqCh0+ij38HLvVx22SArWNI08UnXr/w3g5myFd/ZvozOd0MnUS2Mqk5roOAUEQfY
	kUrc0GW6cWsTx8C6g+c/opk0fm9GJO6XRlhOc30lmALditaL5GFLjOM0=
X-Google-Smtp-Source: AGHT+IHh6O0xWZNdSmDIs+XRRgBqO1v1bLel1oaIRd2A4zdKO7Ksr9kC4ZbOvvs8AVHwGMBGLMFLbg==
X-Received: by 2002:a05:6402:2343:b0:606:9211:e293 with SMTP id 4fb4d7f45d1cf-61281ebe084mr1668193a12.9.1752650145562;
        Wed, 16 Jul 2025 00:15:45 -0700 (PDT)
Received: from localhost (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c976ec04sm8197036a12.60.2025.07.16.00.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 00:15:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Jul 2025 09:15:43 +0200
Message-Id: <DBDAMGN9UQA0.J6KJJ48PLJ2L@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH 0/3] Fixes/improvements for SM6350 UFS
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
In-Reply-To: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>

Hi Bjorn,

On Fri Mar 14, 2025 at 10:17 AM CET, Luca Weiss wrote:
> Fix the order of the freq-table-hz property, then convert to OPP tables
> and add interconnect support for UFS for the SM6350 SoC.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Luca Weiss (3):
>       arm64: dts: qcom: sm6350: Fix wrong order of freq-table-hz for UFS
>       arm64: dts: qcom: sm6350: Add OPP table support to UFSHC
>       arm64: dts: qcom: sm6350: Add interconnect support to UFS

Could you please pick up this series? Konrad already gave his R-b a
while ago.

Regards
Luca

>
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 49 ++++++++++++++++++++++++++++--=
------
>  1 file changed, 39 insertions(+), 10 deletions(-)
> ---
> base-commit: eea255893718268e1ab852fb52f70c613d109b99
> change-id: 20250314-sm6350-ufs-things-53c5de9fec5e
>
> Best regards,

