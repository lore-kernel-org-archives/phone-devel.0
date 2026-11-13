Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794576429;
	b=yYw6O+Cu7yKL4Zr24sEPiue1bqtiSZqkfg0SkSSkz3IG0/QBZZme8RT/JeEhfN1QcvNp
	 RZROYkUsTFNE6R9YkwDwsnD6ihpVNOBfDCXqkQbR9Vlby7d3eA5mJp/jAr2Wq941DLDfW
	 7cPIKwsXMBtHjoBQEU/kdnEgnF9L4GWI7d6JEhcJ/MkELcHBnkfpfrimH9uRS1zGIdOfD
	 sIQ0o6YrA2ccITlP9ibmyTGVBjUu7QQpP90czMdnePP4wmjM0MrZrgHwbPeD5bKAxyFoM
	 amI3DWqJDvRE4QC1ppvj5wmTSHkMTL9V7ePCx6bSnhFzvs6c2ocugJITYoEJYmfNvlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=Atj6jnrbUqpZucEFnxb09HLiMALd8o8ADyX9dmDAwn8=;
	b=VLIGbL42zJllgHJSxJCqoSS9jltpYUCi4Jz+UZV0WvSBIjJAWRDSXTVD5BS58jy55hcD
	 Hk8q+w7i7KCBihanaj2AtmBSTsMBi4NHoHrqVB6hLPQSqaTnDzrZW8t0By6XIZL6j4v5r
	 32E6GZlS/ivkuL47g4Q6HNB2FVbqczpPgg+sSjHbdez8ET7MnFsUVO2APtJy61LwBXuB1
	 zpfJAhwg/bLC8n9WcYX2knrp40aWwc6Fme1m2VgYD+tBxBvKD+4ohPtmSYOhRDyNQF6gE
	 D+TOIo3K6GMZNuzv+CJTw31voe9QPODWllEj77vrzlNJMyi8OnJMnWt8bvm24WU6HEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=F1yZ87jM;
	arc=none smtp.remote-ip=74.125.228.70
Received: from mail-ed2-f6.google.com (mail-ed2-f6.google.com [74.125.228.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0B9606ABA2
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 13:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE0B9606ABA2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=F1yZ87jM
Received: by mail-ed2-f6.google.com with SMTP id 4fb4d7f45d1cf-6a5d790cce1so593580a12.1
        for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 05:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794576427; x=1795181227; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Atj6jnrbUqpZucEFnxb09HLiMALd8o8ADyX9dmDAwn8=;
        b=F1yZ87jMnXnJnLHZNPOxMjDFrraMurLQnwrX1PMENdMZOVISppTaVGBEAtXvSg6sOz
         i9eAuh6Cgy71jZrixdwAxgT137uU60LKBjJZoecYrDmBY17aqhX0CQK53z3/DFHzp3OS
         HO8pY1ChVVmzaURKpqR/0uDaIqzBpuWsL7pNlWQv+WWGPTGnGiWVhc+sH9t3ocCdIsk/
         1gaPJkUFZkhMnE29cSX/5rSBAPg25LLQMAhR455VagPty+KLpeKraqzH7YhZa0gufVVd
         L0RdUdI/LMnKL55WBR+7ihZnx6jRxbWPHl6iZ6QPdbO9T4NB5waWuYKHll7qFbYZnn1L
         5Tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576427; x=1795181227;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Atj6jnrbUqpZucEFnxb09HLiMALd8o8ADyX9dmDAwn8=;
        b=KoSyghlk/fphPfXgIvtVQqpjVpcaw0SGfksBRDJ8EkZ8uP2IBBXo1AFs0LEFYODvgz
         rGWwJC/Mjbur4JiyjaadoV1rWcxhBX/NsVmFysv2fGjGUC4krgc8u/FGZu1PTxIB9Zjq
         y04kgBtqpYvaMcolU67MfJi03BLMUMD0XR03Yi+HoMqvKnzXIbrQiBgNUOpKW8a4RBSv
         3BJR8zmmWfoUJ891w5Eou7QJXCbV4723wEElb8ib078Oh0eij53VZX1lyN15Np+u4yHM
         X4Ks0OpZGmiNYX5hLjX9oVUd0nvVO0r3UAUzyBgMwg5njm8fIAaMPbT0bRbDbR1m/4Nt
         MVYA==
X-Forwarded-Encrypted: i=1; AL+hErFa+9pqACKB3eXT8+DTD5L9YbdeVlBRDEMBW6E1HXVzlZIenKzELCefj0ww5lFJBM2zK8LTXESrshxhrA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ywRg0ZTUC2T3gZzKXakH7kE9DjRjuDT5vjlkYohCh51qZvY9H
	aengzs+c4wEt3YkL4IIBJ6Giq5k0vRoCFKVBhpYszBBXz4aMzyfxE2DAdZDt6xXLTRA=
X-Gm-Gg: AYBFou2lIJGFYQDXdCHKLtwalHpsbaOZAcoD72aCdIzeV5OTL28gHRh+5xES8zVkUOF
	F650Utk9gvMcTgOg6cEPZovUDyPuD4abXiRdx0jGK9qXBymcBTK2n1Wdyk5Dmme/fxE+dmI4mzI
	WEfbLA+RMmTfbdkqpl+x+fOwwB7fTyWW1ZSDhKi/2YCTpX+dnPw4BoKL8laFBKXvDOo3a65BOGW
	jazLAvXziqyQbR234umFGV+MMvsPjNMpDTN8cR+qjx3K/A4JQ+QRPCWK78ibKqsZRazGVbwI0v2
	wJ+m/gtc49hpF46aPropKuxYmBj6Kx9o2gFBYAAP6ceV98VGV0c5tn5oU97e3t3C5gR5BnadWrv
	Nefm2TZA6AgJ8KvsaGKqZ47RjOYFyAPXde0Go3lAKMXmzKbzXHWXgMWdyaFLRtWDrbq9NgWDtK3
	bs/nnLNllYXKOziHJmdPxdWnqsq2s+tf/WDRW6i8+1jrPhdZTO9dCeuoJkzQkV8YKmyfPnN5la0
	veOY6tWt9KG6QoMC25eYXSf55uftEIy8316wHEWgaGvMaEmjRCkNu2gEI9Sl4fqZfgAKHXR05Si
	s63HjPV3D8dlgs4V6C5wOohNAMs1R6w51n3UZEz/uGovPE6fudcngrK2mKqdLdbdpFC2temfiA=
	=
X-Received: by 2002:a05:6402:280e:b0:6b6:f22a:8def with SMTP id 4fb4d7f45d1cf-6b7c0ccec63mr2358666a12.34.1794576426950;
        Fri, 13 Nov 2026 05:27:06 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c1e49be0sm968246a12.0.2026.11.13.05.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 05:27:03 -0800 (PST)
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
Date: Fri, 13 Nov 2026 14:27:01 +0100
Message-Id: <DMU48Z0SWPHQ.1HRZYE04S91HX@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Val Packett" <val@packett.cool>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Abel Vesa"
 <abelvesa@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Wire up
 PM6150L LCDB
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
 <20261113-lcdb-enablement-v1-4-1dc40b49ed82@fairphone.com>
 <DMU3O9G3L6PD.2CE9WCHR9LV0J@fairphone.com>
 <e2f89f72-be30-495d-99c8-828cd170ce50@packett.cool>
In-Reply-To: <e2f89f72-be30-495d-99c8-828cd170ce50@packett.cool>

On Fri Nov 13, 2026 at 2:09 PM CET, Val Packett wrote:
>
> On 11/13/26 9:59 AM, Luca Weiss wrote:
>> On Fri Nov 13, 2026 at 9:16 AM CET, Luca Weiss wrote:
>>> Since Linux has gained LCDB support now, wire up the LCDB regulators so
>>> we can turn them off and on as desired.
>> Actually after some more testing with extra patches, it seems that on
>> FP4 the touchscreen stays dead after toggling the lcdb regulator, while
>> on FP3 it works perfectly fine.
>>
>> So please ignore this specific patch for now, I will figure out what the
>> problem is and re-submit. All the other patches in the series are still
>> good to go in!
>
> Your touchscreen needs to be a drm panel follower and/or reference the=20
> same supplies as well :) Most modern touch controllers are part of the=20
> same physical DDIC as the actual display side

Yep, I assumed the same. Probably need to resend the init sequence [0]
after power cycle, when the panel is back on again, to get everything
running again.

[0] https://lore.kernel.org/linux-arm-msm/20260821-fp4-hx83112a-v1-2-474941=
bd8860@fairphone.com/ hx83112a_init()

Fairphone 3 should be a similar setup (FP3: hx83112b, FP4: hx83112a) but
apparently the hx83112b doesn't need any sort of init to start sending
touch inputs compared to hx83112a.

Regards
Luca
