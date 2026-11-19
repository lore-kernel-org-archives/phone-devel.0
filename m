Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079592;
	b=ATjpUUngLHataRNxLaJnRVi8J9Hw3SnJBUcAEgukp6sMFUPl30P20/B4t1GSXpgQA+Ij
	 C5vD6SvsxmV3ZF55KE80BLNuPZK8pYzBSXLGMJqDRnrKaziJJKOWZOOJHt1zwajfHuleX
	 9hInydjWHsjuZCvutHfOvNdTHQIqoShRspbV44K9xR/cXvJIXtPlHgADq7/YPMNGL4ivm
	 lH59+YtVap4RRrOG/9sMJiO8oFlQj6B3ZlQyRuZQnvB4FnNxrDtZ6bR5mZGAjK0sBTqir
	 64aGYvxb7tjNFXeczUR7RqTUQbXjvHR0wYchR+h1ZDQYuNpP3Zvx8BF2v1xionSpWjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=kpg+BVDggcvUpSEiuxjRpyylph3rGxNLp6K/2aQmllw=;
	b=kqvTVsJdisLbjk+7ceBfs8XxI8dP4NRSKyM24eIDttt1bQ6vYv1l/u/2QSFUSlH8CzSo
	 Zfb7KMSbAIHJyDJD4+3m4agw0PxxXVnlEJYS5ayNo3aShcNj3Kuzydu05sa5PPLHJY/Pl
	 EFg6KO05IFL9YvFXyPIf2F7d+pOh6P71wjSCDhVp8NRaUUSEGbdnAcSuZoO92l27rXF+J
	 37JV8P1szeRM6+brpyFgBBL+c0EKBTgemjQ40fy9iugwg5cSgDXItmgrUb7lS6KApKLED
	 hg2VI+HD+i/s7EImflf4uccvOroNTsg6df8DXlAD3f3IxnzHM73//8Hd1CBzQAPLJrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=cyYxEfas;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C77606A325
	for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 09:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19C77606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=cyYxEfas
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4cdc606b47so336885266b.0
        for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 01:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795079589; x=1795684389; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kpg+BVDggcvUpSEiuxjRpyylph3rGxNLp6K/2aQmllw=;
        b=cyYxEfasnJ1RB3+F9HQ3kC+3x1Suvkc2D89LpTI8+pw+eAAwycdhqJavNg6jfArG06
         7JOCKyjIFZw+nr/clzS/FlZF0tkW/tGCuolgw1y+hnhHah0vaD1owxv/OtpdlF+et24+
         5L6UDEJTNVsrLK4J+ku1kAWCSku6cLc/TckT9iAM6R+oPGnlb1CUiB3kUc5/c+MqFRyB
         stqsA0fzEfvyMaiEWLDvydtQsTclnOH9ybTAeNhVohSNOZyB0c9EwQfXP1kwiRFNT07A
         zWt7aKVRGzi7F2YU/x0W/Yt/TXqrDRWJJU0hid5GcWy+qSpR7k1tulgob5DMl37cK+Wq
         ZePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079589; x=1795684389;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpg+BVDggcvUpSEiuxjRpyylph3rGxNLp6K/2aQmllw=;
        b=l/CdFchtSy+DzHhQhpVNJ600ML9gVvQIdErRxR+ycTLn4A9kQ1dbRvxhcnHEmokG+S
         2Sdyan86+p6h+x3Id12m3EWtywuYjV7dBIEPVcT1pfHcug9LfEPsLojVoIFknrV4AGKR
         49YT/WnxP/RqJYcVvuaOTbJITbQq9NDrfBEE0KrFZU3E/yegxmdLHc8DeY1/x51yGs3T
         vJ9ibFW8QB6qYdS9YW/F37AEBwafuGakjE1hgjtONpu3o15QBcTP6QkQLFjwil0qt3Ly
         A9L4aVTTe+HxibWy3xFq8dFEQzGh2Sr8L7GZWYtnti/xlOzZ4n54oB0+gWSOWT+Ht7Na
         2nEQ==
X-Forwarded-Encrypted: i=1; AL+hErFhd8BiE6FlsEOjrmnWVgtkF5SI6BivHOaDVoSRNnw72K0ShvaDhEyvi3+VUipfXFQMoBU4vEIZ6SzgIQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8MfBvlPQ5zaw5hGDzJ4Sidu5y7vHLCQAkkOZZ/eMGG/pc+4H+J
	ZQL+3suAGtr48Us8NZ4jX4UEW4eKcyzxofBXXVXWd6BuFVaLxhKybZrZGZHJPo/FD1k=
X-Gm-Gg: AYBFou3HHfk4hCsYJeJJkyJyuS9EKRC/7QKTz7hm16DVtflXxO9IYOye/9nchR3UJPi
	HSiQhbokrMp/fmdQRV/1bKUtxRI7YH+DddTAfuphr6orxgP+8ZJ7x1QSXQJdxqao8Zi3HP8GD3f
	Mez0meCS0bQexy8vDh9hHydKdnOXwmAfs8WNuigiSJpq/hgT6PsgZM6qyI1xkyZ383rNT0XvWxQ
	cMykqgLN3/IazdNH9FrXYDevTo7oV4GkWBIXmxair6trIyPgAO8ThavV1rDMCzJCaxfmAmXJjxM
	HSRSs336FVdKSb80Qy3QRaB15qTFMmkVhmxyMKceLWWAiUe1KsMdd8YYvNc8ZLEeUcXyfSiQcUq
	X+ORl297v4Aj3JwbZxB2cfFZvoTX1piMy68wjcnHx2F6fOggNcfZZnzMOPGvmOCVjiVjr7pPqzh
	trpyscYStsAylJH2nCgfn3aaw+lm14hLdn+nZpLOklYnsW3RZuAUt11OMhqUDjjc0kOW8cgFJ+r
	30S39602i18N1uk7Jp+iV3B8C2LvfDlq7hRF4eKnFAw1CADHztoTnpOpuickaaih1rXCt8NlQIM
	q73aQQ7w9URVWiBRW6d5wCYs/p4/x2zyIQ3+kKm7Gv7rjaOk9ZQ80jdHOMDe1sUQMlb9Cc60JA=
	=
X-Received: by 2002:a17:907:7295:b0:c31:8cfe:9a25 with SMTP id a640c23a62f3a-c510e19d00dmr455876466b.9.1795079589464;
        Thu, 19 Nov 2026 01:13:09 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c512341e0adsm87945966b.36.2026.11.19.01.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 01:13:09 -0800 (PST)
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 10:13:08 +0100
Message-Id: <DMZ2LUM6AWXG.4IUB01OTC2NF@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Rob Herring" <robh@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba"
 <lukasz.luba@arm.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Laxman Dewangan" <ldewangan@nvidia.com>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Hans de Goede" <hansg@kernel.org>, "Jens Reidel"
 <adrian@mainlining.org>, "Casey Connolly" <casey.connolly@linaro.org>, "Val
 Packett" <val@packett.cool>, "Daniel Lezcano" <daniel.lezcano@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 2/5] dt-bindings: thermal: generic-adc: Document
 #io-channel-cells
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
 <20261117-bat-temp-adc-v4-2-14d5d309ebfa@fairphone.com>
 <20261118164229.GA2892053-robh@kernel.org>
In-Reply-To: <20261118164229.GA2892053-robh@kernel.org>

On Wed Nov 18, 2026 at 5:42 PM CET, Rob Herring wrote:
> On Tue, Nov 17, 2026 at 09:23:12AM +0100, Luca Weiss wrote:
>> Document the property to allow using this sensor with io-channels.
>>=20
>> This means that the output of generic-adc-thermal can be used as an
>> input into a different node.
>>=20
>> As a specific example, generic-adc-thermal takes in an ADC io-channel in
>> Volt, outputs temperature in degC, which can then be consumed by a fuel
>> gauge driver to provide the battery temperature readings to user space.
>
> But this is already a thermal-sensor provider, why wouldn't the fuel=20
> gauge use that provider?=20

thermal-sensors =3D <&my_generic_adc_thermal>; could work, yes, but IIO is
way more flexible and can support the required use case very well.

From what I can see no device binding (or Linux) uses thermal-sensors
apart from thermal zones, so actually doing this for another device
feels like re-inventing the wheel when IIO already exists.

Please also see the cover letter from the RFC[0] under "1. Do not
implement IIO device in generic-adc-thermal"

[0] https://lore.kernel.org/linux-arm-msm/20251010-bat-temp-adc-v1-0-d51ec8=
95dac6@fairphone.com/

Regards
Luca

> Seems like this is letting current Linux driver design dictate the=20
> binding.
>
> Rob


