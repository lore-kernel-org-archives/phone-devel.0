Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843833;
	b=LqLSmuB3HGvR4gmLsjQUvB98UQW4VDxDM4koVBGLltsyOMWu/t8STwKkrE9P/yiUSIFj
	 wWFPijpTGRQbazqrLfWToHRAGMqGnPY56ddzyZxKcP/cJH+pjPJa64ww1nEKbGcZkpGSG
	 Gzoqv6PtlTn8VettaF5ONobMguIYbHAcNWK/k92kCeak3My5wTJhkvz94SSXNb6ibz8Sm
	 73+QAZJln3wPioRgi9lzlzef6dnEF2R+5j92MbrTgcPGbXPW7uHBGSZPRAkS+ne3+GglD
	 GCr5KQJtHoaur2LmG5xNFXvA2zkFTUSz1d25X8y8fq1OvhqR2Znx1ETCssapWoIvCmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=1bL8r5cuvqq5fGscdKSHB0SmDxdHtxTFoTFxEiXAMqo=;
	b=F2YLh8v0Kmg6/og44UfqYmz/BLPy6ZELVZ3/3gzf7CBWH5pLejuESbjFZp5iYWOr/hz3
	 BecLNOTg82aFdGpYbkdorSUoD5MNdsk8CRAcJ+1MxH33wJHRDOKjtoJzdUhnHdrcYbyZQ
	 Ox4mEWZ/xNm3YYCqH1ed+AS+l61bQUzEQpmTKGKcKUxEYR/TX4rPhb+fK6eK2g7gTHu7L
	 BVnxI8qAurCrfuGk62G7dfSfj93Sux3CEufX+wBUfyoYe6yH4ZOei9u3QOhZ3saRRRBqq
	 J51PpNfdYWpL9aws/pkEC1IySX0h9VFJuGsEqJQgWeuIXifCMFRxZ0QK4mXbOwdF9Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=l5yFnpD8;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A471606A32C
	for <phone-devel@vger.kernel.org>; Mon, 16 Nov 2026 15:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A471606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=l5yFnpD8
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4697404c2bso487079566b.2
        for <phone-devel@vger.kernel.org>; Mon, 16 Nov 2026 07:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794843831; x=1795448631; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1bL8r5cuvqq5fGscdKSHB0SmDxdHtxTFoTFxEiXAMqo=;
        b=l5yFnpD8es3PZ8hErhgAyB6jNHgRJQL2UrqaB+35VDA03JWtWhtFRjub4w8iKrO77e
         FcXuh9bolv6SYa88Apk3Cj+9S5ZwpsJlBdiFSEej53nktGjQ0LAsYndjgYq4DB2bD0yl
         Nyiy5scYIfhVrAS4QNSBaNJydK3icLZBN4M0F1B1L6Waj2/CbMjaV0UG6L7lgr8aVaGD
         pXTH8mr0Uek6+QgkGZxJY+7f0zkWMqOFQHSdN9vHIUiEuWSmJok/yRbEEZJRUESbTGNj
         3zjw9jYFXIMQVSV2tbewdyiO4fsAHVQXDakxoF3J1EzoW4EzlIXY/FZ/rBxt0ZFpDLkw
         9Hbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843831; x=1795448631;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bL8r5cuvqq5fGscdKSHB0SmDxdHtxTFoTFxEiXAMqo=;
        b=h8D2p6Wl25A14tEeHRgWOPNlZmtcej+k3M4/KiYMbl2NtWgPdXpbCq2sccjd6YrU0p
         9yKHSxba9H7rGrQDSKNNE1wGQWiZcd910vT0wyUTVBcmbFqA0UbWot44/0b7MzXQCLtP
         4R0ETnlV6zUje6QJs0um9ZI+f5BeOkC2ZG5IhEEV0sIiR1cXfDZyc/N/b52AsKDFsW5U
         J3nJ8nt9QEVSTlpcVG+I/FmfZKh7zeb1VnbkOmqwp8a42uDr/hXEfwBn4ry8v8PWRk0s
         zE7f1HWUhqLkNMmUG/d7Y6Ews8+yy9ALF9PuILK2pc3oWUZnTq0ertth+8k75g/1YX8p
         PePw==
X-Forwarded-Encrypted: i=1; AL+hErGk8JiYiS93+vijZhPiyMmohfB4WCeOinsi+j0Ij5FAZ2Q2eDNkxjlPY/3yOmw8TQpMsKjJEhRkJPjY2Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/eyEOZO4zRA49r1udFRderBsnGc+r5fdVdnm59i7r7CdF8fxck
	hG/wv3VrKFTbztrr7X1zMJcJBkW5c7YMtJSFcf5Vh5h6jx5UKiLXD/mfuB20wqgq36c=
X-Gm-Gg: AYBFou21/WjNzMnqS9MLa0ji+xYKrAyA3inZ2F5gSroU0a7/KE82TPZx83cPoNXI5+W
	ovIFSHWseqWCX75qozffo/xNeqDbzJKf5fB3Mzpb1GSS7kpfAmUUszTPdRcWV/dk1lOjW6PydKp
	BMRj/vby6DDEFGMwaaWUGdhinVEQUoeTKcp1id6C91tRXiCDKeUfgNmo3cca29OMpIRnl8jD/SW
	NPl7XcbG3YnIByCDHMOnTFlk3Sr3+1teZnGGKDJp/rQvBBEfNVRp77cmC/JATVMqDLfCpac+//R
	bPQJuRoTM/7qwDxUagx6Tzhczu1eWIn6/Zyyyk+68VlGALXe7/cefyik7TWA7oxztmHM32HubaY
	/ei/lm7LQNs0nY4PmExu8YWL/VNWcGbRIdVjDiRI+qjD5pILO+BR/3/8vsSHPe5lxcOm5Lz7b4e
	HQbwEuf7OxY5jmEvscyHXWFYVcNFCxTCYeo3Ab6iQ3kaqGdG6/r9Ri5KyeL6jHDK9nH71NO8qV8
	b1cjfItQgYmAngvP/t9ku5fad1WRqKSZjTCI9UNJdczQSqVqcskk8CgrXLK9VrOaUrQ/KWJ2jS1
	SogTQdlLrpMk5VUnbjxfKuyQj3WG6jxR3Spyi9AlqzmM30tVNhwZv8bGn/5Lc5RrCLTQ3klrCg=
	=
X-Received: by 2002:a17:907:9305:b0:c2e:4e08:19ab with SMTP id a640c23a62f3a-c50963d50e5mr844840566b.16.1794843830845;
        Mon, 16 Nov 2026 07:43:50 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b40918sm439294866b.39.2026.11.16.07.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 07:43:50 -0800 (PST)
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
Date: Mon, 16 Nov 2026 16:43:49 +0100
Message-Id: <DMWR1CJJRHMF.33YRRRDXPMBDW@fairphone.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba"
 <lukasz.luba@arm.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Laxman Dewangan" <ldewangan@nvidia.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Hans de
 Goede" <hansg@kernel.org>, "Jens Reidel" <adrian@mainlining.org>, "Casey
 Connolly" <casey.connolly@linaro.org>, "Val Packett" <val@packett.cool>,
 "Daniel Lezcano" <daniel.lezcano@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 1/5] iio: adc: qcom-spmi-adc5: Add battery thermal
 channels
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
 <20261113-bat-temp-adc-v3-1-743979a8fd90@fairphone.com>
 <avc5rnvIAEmZbyE1@ashevche-desk.local>
In-Reply-To: <avc5rnvIAEmZbyE1@ashevche-desk.local>

Hi Andy,

On Fri Nov 13, 2026 at 5:24 PM CET, Andy Shevchenko wrote:
> On Fri, Nov 13, 2026 at 04:56:42PM +0100, Luca Weiss wrote:
>> Add the BAT_THERM channels with millivolt as output, which can then be
>> used along with information regarding the NTC in the battery, to get the
>> actual battery temperature.
>>=20
>> A static lookup table in the ADC driver won't work since different
>> devices have different Ohm and Beta values in their battery NTCs, for
>> example a NTC can be 10kOhm & B=3D3435K.
>
> ...
>
>> +static int qcom_vadc_scale_hw_calib_therm_volt(
>
> This is broken indentation. Was `clang-format` being used to achieve that=
?

This is how the rest of the file is formatted, I didn't deviate from
that.

>
>> +				const struct u32_fract *prescale,
>> +				const struct adc5_data *data,
>> +				u16 adc_code, int *result_uv)
>
> result_uV

As Sashiko pointed out, this is labelled wrong, the result is millivolt.

The rest of the driver consistently uses "mv" for that, should I deviate
and use result_mV?

>
>> +{
>> +	*result_uv =3D qcom_vadc_scale_code_voltage_factor(adc_code,
>> +				prescale, data, 1000);
>
> 1000 is odd, can you use something from units.h or combination of those
> to show what this multiplier is for?

This is converting microvolt to millivolt.

Shall I use "(MICRO / MILLI)" as used in plenty other drivers? Two
drivers in the tree also have "#define MILLI_TO_MICRO 1000"

Regards
Luca

>
>> +	return 0;
>> +}


