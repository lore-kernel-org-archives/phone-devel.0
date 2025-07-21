Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088E728467C
	for <phone-devel@vger.kernel.org>; Mon, 21 Jul 2025 07:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753083763; cv=none; b=ogAkRLTQogdGyHqQupJ6JyKdRt1BeLdiaCHBv0VW5etjnkhfM9j25BmdmP52F2/VIhtugYXdKzEdaefu6k4Zaw1zYHGwQbfyRqP07Jz/EV3QvqVLpHZBZtyCTASh6kgIC6ix6cjzSLYqoScE5Wi25hqbcd2OaECat498+PditCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753083763; c=relaxed/simple;
	bh=chzQDhpRR0KkFFSvGWLDbsXZDi/1ZGpp4j7nqK/5mxo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=qphgK/CXXhKoq95ojj0ezOLjn/lEAg+WNWL7co3eJSKoQ25eZd+AgdfA3n4T3jRsgYU2FeDMbdsjyq9U1TBfG8g4Z7y8V1RR4D/7M3mYCiWnOSEws5Ft6HsxxAAVUdsqXQL+JRPXqckPXdAArxOS+M4SenWml4Ned2raGA4IkXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ZHmo0Ofm; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ZHmo0Ofm"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so8979038a12.0
        for <phone-devel@vger.kernel.org>; Mon, 21 Jul 2025 00:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753083759; x=1753688559; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Jn2uM1C1hodxQz3Up00DI8ehhdUTfz2Vy9NLN+SJQA=;
        b=ZHmo0Ofmh0GkYtbtnBrkBXAph6ck5S93mdvYHgMT1Cne2rvnNOQkE27CEbOH1xWS/7
         NhgvCVGwAxxwAxh22dRuKuoulqNM/d/FsUKcb1VemcCWyMYH6QgERk6Q5tOpz62rJ3QC
         zIhQHa5gKeToe3Un+4ndbomLZDjnQMxtXkTO5MWnxxlbEnNeq+td2/Ll52U7KBTMz+Sc
         +aVIqO0NTLIbMfJVE6AyOWI25bcEen6y3VcNIEKh58NRUzqIG5si1ez5wHVgcp2YseYr
         vXxugd/AKgiPEnver6TieHzQH8MHdowWSrW/lf842esl8Y/aPjTuhRbtFzirf+5gDuRd
         nZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753083759; x=1753688559;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/Jn2uM1C1hodxQz3Up00DI8ehhdUTfz2Vy9NLN+SJQA=;
        b=AzFJzEw2q/IMJQimXvwdR+6T747ctbtaeJAmyPJzUVTJd9tdK2Bbvg35y6oey5L+2F
         xkJf0uVSPOd+V3bSBEd5aKX0SffMb5n/MtQFA8WCvVQ5u/ZrzML3wdUMOxEyeqbIQyRo
         t0V7X8Ga4kqw/MEk3wWHlr1C++y6jMOz2kDFFTXx9vf9ijxVrdMzW2WH+mLYub8CkTpu
         bt9cKgOl/I5+ApBiIHvZvFEwPosOxoGIxCMVHJv1KIJUhmkf2FvSmQKj16pRkXX4niqC
         hg8Z0j+HW1v7r+f88AMNatvuFu01OctzFC1P37/syk2YJi7aAzyGF5TqEZgDZLYb5TTH
         ilaw==
X-Forwarded-Encrypted: i=1; AJvYcCWMcFOAvyUaWK/sXDVKc0pjrNoPmsCGmS+AYnAs8kVcg87XErzCRyTsl3wUTiUgg+pgsykBbIlRTIRWaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1pfeczY7FC427ZWQdtGikb9oQQbwgwiGCuyZ1LuJOSdm6qdYo
	WdtVTUffDGoXLmrfEqkavYIo/1cBHzE4n1HqZ+y5eQH6NU7Uu8PCzb6O9YMbaEQR7Xs=
X-Gm-Gg: ASbGncsEzCQ+v9EXIrPvUIbJe6jv2HSVY6TjHFBYhNHqLstoKYTlJwQGeC3UbnJeAd1
	VymFP/sE2GUsVo8wfFNu9Xv6bjYDwccGrcu9GUZhhVAJWHNQUwwSV4C+h17pY3hgtBu177aqKtq
	KBuu8QXfcCQ75MQb+v5F/sRU5iS9Aw39m/T6LjPxmH7dYtNqFiEftQO9RS4Dakz0/eYVzQ52U2T
	mVx2KFIwcnV4+3keJ3R9WG7w5hBORGGEbH5Al5T6cYQ8Cxxykk4mVs8GV8qxU828jAZG2RSEqEP
	3WfAxx/k1olhVfEbK2c92KrzbFu7IFpfRRM1gXq8LpMBP9y7C36pQIsgwbIViQ0e4W1FlALEHQm
	7AsYXHf6RVKB59aNaylga+59EmPcHVwjnbqhJwPvn0XQfonrNWnbqi5WfIrdcDSCRCpLZRquefG
	Wg5n/jCZES4xCkrZEngppiqdl7aEYRL7M=
X-Google-Smtp-Source: AGHT+IHojokpIKOVzO2mTGfd8U+xB3sxarTMHuXH9C3us/pGvkjTIHvaL7YhUPwGxvFGX/BiGyYmDg==
X-Received: by 2002:a17:907:a901:b0:ae0:a465:1c20 with SMTP id a640c23a62f3a-aec4de61a29mr1564976266b.14.1753083759251;
        Mon, 21 Jul 2025 00:42:39 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6daf4579sm615655866b.77.2025.07.21.00.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 00:42:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Jul 2025 09:42:38 +0200
Message-Id: <DBHKBSK14XHM.E3ZUQMEJKEOJ@fairphone.com>
Subject: Re: [PATCH v3 2/2] interconnect: qcom: Add Milos interconnect
 provider driver
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Georgi Djakov" <djakov@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250709-sm7635-icc-v3-0-c446203c3b3a@fairphone.com>
 <20250709-sm7635-icc-v3-2-c446203c3b3a@fairphone.com>
 <d8955532-9a3b-451f-b5c7-549cee7d749e@kernel.org>
In-Reply-To: <d8955532-9a3b-451f-b5c7-549cee7d749e@kernel.org>

Hi Georgi,

On Mon Jul 21, 2025 at 9:36 AM CEST, Georgi Djakov wrote:
> Hi Luca,
>
> On 7/9/25 4:14 PM, Luca Weiss wrote:
>> Add driver for the Qualcomm interconnect buses found in Milos based
>> platforms. The topology consists of several NoCs that are controlled by
>> a remote processor that collects the aggregated bandwidth for each
>> master-slave pairs.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>   drivers/interconnect/qcom/Kconfig  |    9 +
>>   drivers/interconnect/qcom/Makefile |    2 +
>>   drivers/interconnect/qcom/milos.c  | 1837 ++++++++++++++++++++++++++++=
++++++++
>>   3 files changed, 1848 insertions(+)
>>=20
> [..]
>> +
>> +static struct qcom_icc_qosbox qhm_qup1_qos =3D {
>> +	.num_ports =3D 1,
>> +	.port_offsets =3D { 0xc000 },
>> +	.prio =3D 2,
>> +	.urg_fwd =3D 0,
>> +	.prio_fwd_disable =3D 1,
>> +};
>
> Thanks for adding QoS!
>
>> +
>> +static struct qcom_icc_node qhm_qup1 =3D {
>> +	.name =3D "qhm_qup1",
>> +	.channels =3D 1,
>> +	.buswidth =3D 4,
>> +	.qosbox =3D &qhm_qup1_qos,
>> +	.link_nodes =3D { &qns_a1noc_snoc, NULL },
>> +};
>
> It's very nice that you switched to the dynamic IDs, but please use the
> current style of links (like in v1), as the the NULL terminated lists
> are not merged yet. All the rest looks good!

Is what's in todays linux-next a good base? Or what branch should I base
this on? But correct, I currently have v2 of dynamic ID patches in the
base for this.

Also If I send the next revision by e.g. Wednesday can it still go into
6.17? Just wondering how quick I need to work on this.

Regards
Luca

>
> Thanks,
> Georgi

