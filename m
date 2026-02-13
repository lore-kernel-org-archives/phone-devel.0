Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6750534F46D
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 13:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770990142; cv=none; b=j5zuVir3rr9zyQKTX9jo6+RS9s9BTySi750+1/uRdFLSFg3G3TCOyubyw+yC1rfUSllN1H7+PEU2tL7H9VY3IMUZ6qipA9lyVpryCHx6YxTea9BMqN0iDLlovswSHzdY9GDgFU8n3qCDon2wqG1WZ9H+4BucCTnqf2QgiKUnh60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770990142; c=relaxed/simple;
	bh=v21aUaRExic4asjKw5wpz45cMKkg6xm9+FuILH8upa8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=oThRyd1f0wXecnl6RcME6ugqn/HdLAel4gfTFarav4NmG0IUsCiUaxuMJQ6sEEgG0d5dKedLrXsDLRVhGAOffBU3XYNi6U/eSIoq6LTMYWZxHkW+yNNW5MplkcEWP8q97+OM/rVwyfpAkWVTzxma9BnmV+y/WOkwOJLiPg2tShc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=LNf6rBTy; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="LNf6rBTy"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65808bb859cso1233319a12.2
        for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 05:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770990140; x=1771594940; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjlPOi80qwfClu6vEE8PfXH4lJ/jNSkLMmn/VxZK4i8=;
        b=LNf6rBTygDqcP8xmNfi2pJ4S53exB9KaAmmL9qCOWSSTNqa0JBULJ0ysMpy8bcTH6z
         Jf4YbJcqqd5mGyDP7I61tYzppb/W0FG0q5flhnSMW0pXHpzarl/RsPZ2qVV5+JNAn/zX
         oP5TrbSRxCaswZsj+U4QPts7sIHHhFQXesGoqtp0JAIfOtwZzM/KoYFWjhTJTQTaqTTN
         MGomhUw2KqXlPAJwGqiNsn+iYV8vIApPYc+xB7bQSewig5t9EBJuUgfgzIDyFTHxcxCh
         YR/Dy4HEUlRmkafw8Xr0Rh3RnM/4z5jz77jXf/fXTm+axKs9pVJQYwVj/KerDEf6jqX2
         afiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770990140; x=1771594940;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jjlPOi80qwfClu6vEE8PfXH4lJ/jNSkLMmn/VxZK4i8=;
        b=dPKvZSQHeBSuLRvB0NpCqqRXZAFhNR8u4SsIeU3atyWaCZ3+6BW7meSFxw2Dm0WFej
         M72gKsXVFkRBVioTEhxlYR+SLPV9bfDVriKn5gEVIzHkmn8NNVZ9zyuFJ3vJsjKmNkbX
         zqYMChY8/bCutcdVV1DVzRGRNlleel1xoteMCrJLVpb26SiEZJVQZWFzWGdTMAZbwYHy
         o5kR55nuzjF+wMiV2MhGiVGQOj1m3QFn47tbf+wnKeJfUNcYtJhaXQjk+1gJpZEGpmPs
         V5rtp5ikqQHZqEfwG1fvzz2t14KLoYBeuzmO/nN7d8sy6deYgbPwso7EMVVKy8/u8n6F
         hzsw==
X-Forwarded-Encrypted: i=1; AJvYcCV0YTo9OkTzuj5lksBxgg9m/E723zADapfcTN3wggg5xkPuTQHJ18UfSW5sVnC2m2OidGO76a0AXW+EYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcMGSKbkOcLbgMKZjXNfMvFrR6JG6f9KU3xPQ7e9NpfesycfPH
	hvAMEgUh+fgvkVghFlv5IU0+Az7+IjWEdo1e8g2FnQF0dTr9m8c9FnxlPkOdD4Hd9hQ=
X-Gm-Gg: AZuq6aL4U8nO5xpK+bQUq7VTBW7w+ERY/LUeXtnA+wVBr0XLXc7uMrOHitbAhR3NjQB
	oOv0GTH7DO72XzPNZVXgF76Dclje5IUidsZng9VrdGOIbNNB2hnB+hiaeImAk77l83D1fdHtsgI
	Kn4wR+DuiYV7bm4FqrjzLaQCWZ6IfjpKAN8UTP4QQD7n0LyX7RxBcoj6VQpRwsUBvedfffgofCM
	n+L7kysFbP4uGiFpoILI7XwCawhOZy9phKZrWty6bWXiWDCvRI2MlcCKXjg75ApHRrRVW6ZF2Qw
	NBbZQlW69X2wh9wxxtpWbPmo4/xhF4/r354HoEsDb8lpjNOYWwloHdWinljfYjN/k8EZtkIu02y
	DQFkIqyTpZKURdeD8ZcgGsN0h50DM6Hr29UARTH5Whki1j4ZRPsh8Nu1kAeU3FcOfzGUVYxXujl
	AFn5q2ZV3LgK/YF1rxHhDMNKVmX3ovldq79jwWzpxLRLmff/RwUTTEpDwg2AlPwX9rxf0Sxx/C3
	hpGyJY=
X-Received: by 2002:a05:6402:4406:b0:659:4853:5382 with SMTP id 4fb4d7f45d1cf-65bb13c2f2cmr934664a12.32.1770990139691;
        Fri, 13 Feb 2026 05:42:19 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3f137dsm653159a12.27.2026.02.13.05.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 05:42:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 14:42:18 +0100
Message-Id: <DGDVLY6M6E1N.12KFFYAGAD7H6@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Alexander Koskovich" <AKoskovich@pm.me>, "Jeff
 Johnson" <jeff.johnson@oss.qualcomm.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: milos: Add WCN6750 WiFi node
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-3-27b4fbb77e9c@fairphone.com>
 <5fe80f4a-ef5c-4008-88e2-60ad1f8c2a18@oss.qualcomm.com>
In-Reply-To: <5fe80f4a-ef5c-4008-88e2-60ad1f8c2a18@oss.qualcomm.com>

Hi Konrad,

On Tue Jan 20, 2026 at 3:39 PM CET, Konrad Dybcio wrote:
> On 1/16/26 3:50 PM, Luca Weiss wrote:
>> Add a node for the WCN6750 WiFi found with the Milos SoC.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/milos.dtsi | 46 ++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 46 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/q=
com/milos.dtsi
>> index 024e1c9992fe..80feb3e9d3e2 100644
>> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
>> @@ -2043,6 +2043,52 @@ gic_its: msi-controller@17140000 {
>>  			};
>>  		};
>> =20
>> +		wifi: wifi@17110040 {
>> +			compatible =3D "qcom,wcn6750-wifi";
>> +			reg =3D <0x0 0x17110040 0x0 0x0>;
>
> This reg doesn't.. sound.. very.. good..
>
> The size being 0 is of course wrong, but perhaps more interestingly
> the base address is a register within the GIC..
>
>> +			iommus =3D <&apps_smmu 0x1400 0x1>;
>
> And this is a PCIe stream
>
> But I see kodiak has the exact same setup..
>
> After digging a little into the driver, that 'reg' is apparently
> indeed consumed, as a base for PCI MSIs.. I feel like there should be
> some better way to express this.. non-everyday setup
>
> There's this commit message:
>
> commit 00fd24089b8154ddf5b3e724e2c4c9974b9ba91e
> Author: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Date:   Fri Apr 29 22:34:54 2022 +0530
>
>     dt: bindings: net: add bindings of WCN6750 for ath11k
>    =20
>     WCN6750 is the WLAN chip on Qualcomm Snapdragon SoC SC7280;
>     Though being a PCIe based solution, it is not attached to
>     the APSS processor (Application Processor SubSystem), it is
>     instead attached to another tiny processor called WPSS Q6
>     processor (Wireless Processor SubSystem) on the SC7280 MSM,
>     where the WLAN firmware runs, and it is the WLAN firmware
>     running on the Q6 processor which enumerates WCN6750, as a
>     result APPS processor would never know such a device being
>     present in the system and would not detect the WCN6750
>     hardware unless and otherwise WCN6750 is registered as a
>     platform device. This is the reason behind adding WCN6750
>     WLAN node in the device tree.
>    =20
>     Add WCN6750 wireless driver support, its based on ath11k driver.
>
> Sorry to hijack this patch, but I am not comfortable with this binding
> as-is..
>
> Adding +Jeff in case he has any thoughts

To be honest I find it a bit discouraging to get this relatively simple
patch with existing bindings blocked. Yes, the bindings are probably bad
(not that I can really judge) but sc7280/kodiak already uses them and
it's functional, so I don't know what I would need to change.

Re-designing the bindings and driver seems a bit overkill to get milos
wifi upstream.

Regards
Luca
