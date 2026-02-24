Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA30366554
	for <phone-devel@vger.kernel.org>; Tue, 24 Feb 2026 08:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771920903; cv=none; b=hwjiB6RhflL6oR/U9aqtFqruy/5a0oqyYDMwO2pLM/+JGT2XMSbSunWpwlwNxHgjmK7B4z1EcQc8HXxNYncU03r+tA3nNpWZxUD7AQD49h5eidU1nGigf6CmG7+nR2RwIKtJoVSXKj1PnsqI4VsCWW9AFbcWgPXJTrETpmKZfdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771920903; c=relaxed/simple;
	bh=9BNqf2MxT2KB9V3RmWVoDEyDdtAfYIbH0M7+sdJqyF8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=WEAipbTasO1hqKct9T6srYf9U9ZIeGeput+kpo8E6Kb6z5gsYidplNqzXzpkCb1WSwuhwO3Y6FBUE2lP/BTyTV4D13GC8q3M+9mbsNRoT1EsGBc7TLfZxzV/53EP0d2jjnGYmnnQgloxVf/7vksmeO57qRmtLKtTscrRosTEwHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=e/PLKYYK; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="e/PLKYYK"
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-65c0e2cbde1so8987500a12.0
        for <phone-devel@vger.kernel.org>; Tue, 24 Feb 2026 00:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1771920899; x=1772525699; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKXXJGWnu9K3xWMW9HyaDVo1/D1y/DKuzi9/eiBk4qI=;
        b=e/PLKYYKTVwvOJC59T6f+2vp9KK35XkixfJUCi8jTKZP0yiHMyS6pfcomFjzHxfpbQ
         knxi8XFrWlEjfuXlgFAvgTkKZBq4gWLEfJMZD4+jfhKoN2q4G/bj9slSFvButfSgrN9Y
         YsNAVtK/Dq7GCFsgV7LuF1IlOrVmsv97R4MrP6FPstwdbxKns0TovrENx8qlxgrGl0fu
         UzJdPC0FT9ESwfqQ4Cog01EcdUEfyXd7qaWKbRYmgvymrA3s1U1XmEO6/OGrzUZxdfBo
         W3pqi3H33scQHyOm6TBC0uE/8w1ehNpixQ5vjnb4NXm8cRabSWM7CaxS+RUe3/3aVBCx
         xUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771920899; x=1772525699;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xKXXJGWnu9K3xWMW9HyaDVo1/D1y/DKuzi9/eiBk4qI=;
        b=eXeiE2bXLo2dCrPjJYxnrWRuOFf5bjZrQOTs18IH7Ehfi65I/ZkQfbA1UcxzsSmK5V
         YSXXPZd5KMSI4mirhNz24njF2Aj2KoYHXSTzshmq6FScHo17sZb3D9sSf1QotX266eer
         eP70bVeH8aQYgvBDpdTc0/6bxNlw8vDyc5Kl4PxV40SaFMvb0M3a9Etg0hzTjZxaChmF
         IjQ8IV4aawvcZF9i55s4HdNkZkreFD17PnWLxjLgDJtZ+0T/M3M2lxfC0mJXispU+Od7
         vBlQ78u7UYUsCmWEIOfp8uXeqeninewI6J2Tphba1zYyie+62TKLUVfG8bkd4S/KyarC
         XIqw==
X-Forwarded-Encrypted: i=1; AJvYcCWUcGCAlW+A+p6puJHxELaukDO0+ySJtInuVDRSuPb+RdA76sA8Q42HGEjDhUi2ip2uQLdYr9zzvOeGig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYlZ4dA2N5peP1qrVNvxZ232ZQM9yEk7NrH4m+o/gc4BVHYWVz
	QcSqMIw5i+gKg5c/vTApitsJtmVtgIzQBSbmnhFRx43sTOs3nSWutaNYt+7Uk1y+neQ=
X-Gm-Gg: AZuq6aL1G6BpstE9r6fmejoONtcZ1BR0ws9NU50nXPceIEBsxupeQh3jzg/Y+mWAtUt
	eS9mgLb76dWUinOi3QNQSVCQLdmlD3PGjfKOzKjPArJz/Ne1B2C818+T3LJ9cfd5AHQR/7AhE87
	3zfxQnShYcU3WqGzFxbiEFZgTyBLt2/PDleXhbaL7I5fSbdbiKubfHKKLmczytm56SWMAPsGCF8
	8QZXGHF0XrVmGYvd+eBVs55i+csOdGmRo8BO2/DSx3cP5mbOgKyobsCJISueSLbcQjSlfQV/Nvb
	PoWEDARYlPuicXDqN4xIeh4CP3/MdqEHJAXHjgiaPIzpqi5Ca++m1xDuc2I+hieEqqxIdpVdVUg
	bQDfSWROZXlHZocskcg+wJoXnJnsfHLpGB7KnRc/LLdrhz4SSfkGjp9IgqJ2swqw8zDxpQqWvvn
	DfNmAx9MGgRooolFjGpDLf7mEI0a13GijyhFBmgtbAg5viYD4MQpxJhKFHbl+/iAoU1uCfktocW
	obrgFo=
X-Received: by 2002:a17:907:e0d8:b0:b88:5957:2d65 with SMTP id a640c23a62f3a-b9081b40c12mr380726366b.37.1771920899412;
        Tue, 24 Feb 2026 00:14:59 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084e4bfe6sm399567166b.44.2026.02.24.00.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 00:14:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 09:14:58 +0100
Message-Id: <DGN1JB8J9YG5.JZDBJ9WBLDXC@fairphone.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: thermal: generic-adc: Document
 #io-channel-cells
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Rob Herring" <robh@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@linaro.org>, "Zhang
 Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Laxman Dewangan" <ldewangan@nvidia.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Hans de
 Goede" <hansg@kernel.org>, "Jens Reidel" <adrian@mainlining.org>, "Casey
 Connolly" <casey.connolly@linaro.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
 <20260220-bat-temp-adc-v2-2-fe34ed4ea851@fairphone.com>
 <20260223184815.GA144001-robh@kernel.org>
In-Reply-To: <20260223184815.GA144001-robh@kernel.org>

On Mon Feb 23, 2026 at 7:48 PM CET, Rob Herring wrote:
> On Fri, Feb 20, 2026 at 10:19:06AM +0100, Luca Weiss wrote:
>> Document the property to allow using this sensor with io-channels.
>
> Why? On the surface, it looks like you are adding a provider property to=
=20
> a consumer. Maybe that's right?=20

Correct, commit 3762f5851ac5a65dcccadf73dbe853b1b346f561
("thermal/drivers/thermal-generic-adc: Add temperature sensor channel")
added support for this in the driver, this documents the dt parts of it.

Regards
Luca

>
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml | 4 =
++++
>>  1 file changed, 4 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/thermal/generic-adc-therm=
al.yaml b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yam=
l
>> index 12e6418dc24d..317fc39ed46a 100644
>> --- a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
>> +++ b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
>> @@ -24,6 +24,9 @@ properties:
>>    '#thermal-sensor-cells':
>>      const: 0
>> =20
>> +  "#io-channel-cells":
>> +    const: 0
>> +
>>    io-channels:
>>      maxItems: 1
>> =20
>> @@ -58,6 +61,7 @@ examples:
>>      thermal-sensor {
>>          compatible =3D "generic-adc-thermal";
>>          #thermal-sensor-cells =3D <0>;
>> +        #io-channel-cells =3D <0>;
>>          io-channels =3D <&ads1015 1>;
>>          io-channel-names =3D "sensor-channel";
>>          temperature-lookup-table =3D <
>>=20
>> --=20
>> 2.53.0
>>=20

