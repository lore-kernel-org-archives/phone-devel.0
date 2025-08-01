Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B31A266B6F
	for <phone-devel@vger.kernel.org>; Fri,  1 Aug 2025 14:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754057255; cv=none; b=VAJ3xB9BA9jLuInUMNLBZvAWKkhnlYGZPcFkjW+cA6NAfsUolYhEg73+wgDfSAgO60HrmHnVx7mJaX3xc7POntUPrWXP+iBOmUg5MtdHtyOtUQ84IVmvBlk7/2el+0Yj7yvjmLeZFWT5aGz/e7jnKUr2TKct4DEsd/r9h5lue7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754057255; c=relaxed/simple;
	bh=wlC7kP2F/ioJRdEtnIX9BmgqWxNwMFSCwUw9OI+Iwos=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=TbQ4ZXm+ouNu9TqJtJb1lCYnbSPyZEGV7Zk3fiUDbDXZ3UP/uldk8IWwRmBOKM1CaxueoHu4HvrhZcjWtNka0Bmo4bFke9QKYbXp6x1pULD5SGlswjAFwSUcqbGuKo/VDUWR9tdsi8cP4ae8pOnJ34O8MK9u4Te+cYrWGnrvNUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tvHcWEnN; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tvHcWEnN"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-615d0b11621so1229434a12.1
        for <phone-devel@vger.kernel.org>; Fri, 01 Aug 2025 07:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1754057252; x=1754662052; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuxnvwCqyjcDlHCRDIoiI8J6doFQnIolVgtplDpfZA4=;
        b=tvHcWEnNOWxauXAWCJReRI49W/STR3KojInKcEEqjHgiGNkvYAK67hLujnAEOqsJcs
         +jDUqTi7plSURaQONH0nSXjtl1NPxIDKxr50GJ+OxxjM2EVycefW/O9k5p6gv7Wqit99
         eEkCHyPD7PrQf4FpOmCIDG7hx4XWWgCcY+/sTSmmXVnSyWH0TUQVfgWS6qpuuhDK1c7j
         meoOBbe3OfJ8F/+NCiaED5UejbfqqkIYavH5dI9Ea6B7Q1/mGUzdrHHUKmuwj9WbPQ89
         U3ZE5kRJhUmP+X6NOXZtwsOLKUUlW5DShrMefIqEd3jtM2Eld4RylrYgecAiQsTZWaC3
         CWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754057253; x=1754662053;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yuxnvwCqyjcDlHCRDIoiI8J6doFQnIolVgtplDpfZA4=;
        b=TKRo9ctmcZhQdKmyULWXeKMsmgexpIf6lgtLEn+uevaBkLICLQVJ4cgZKGkS6ulzZg
         Xuvpj+jARmFZdAxWtjuCpv7GGEZjYHwbCCxGUZtbksd4DvK3VFhwy7wbP6p/E9/+1nSc
         8Srp329aLinOLXtyV9zUpHzEhUEKf3aiw9s53a9/6KsCSywT8BwGVv2avbs37TJsXKea
         7RkVsh8VRlDyU3pJ0ARuEbtu9kD58QrfR9041u2jXPccqKKU0NlSqMTdTkIdi7o/oUc0
         3Miok9Ozx2eR5SEJUv+WyCocLBQg3Uzhwu77RE6p/S3mcMfv2OTCmT8bYhtj2oLkeEZV
         CF1w==
X-Forwarded-Encrypted: i=1; AJvYcCVoXS9nY6p3s82aln/4j16xJe3UF60taMtEsG/jclD5hOxf4RKA40wqqkTj3zOfzovhoLZSs1yGlkInQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy24rCWkLc/KGZUgrXm2LbTRomx/IAC9I6EBKxF0MyhJz4cuWw+
	ciOrUGe+1YjtS1NL0PQQoN0f4jJoC+ZeAMtL2A92Fw0eppi6rlcAMXFaR1236GIAtNM=
X-Gm-Gg: ASbGncuuNZ+/gfZr/BkieZfhMD/8QYLlkQeHNYAZ5LIAG72lRkolUM8GDgOiyugrmID
	T340oOjGIGPjj4D6sZB4RivGpUgDCj0WCCZuB2gKc2S2qzwvHjr+SUyM1m1qrSGRUwQBs3x/8rS
	XumeDp8ziDDUmI1j1gSkvnBuLV2oxa0kub0QgKDpMPxEfM3tqw/Z7tg9yhb/F4WMhW6ll1CmnL1
	+fVgDZo7U3c8+0IQi5mYEGo3gFgJydxzhN+LvNtFIOS7oWAFGgUx67PlwWPuA1SjGKMgE55qYTF
	gJMtPGKWFlTTgws74d9i0eoqFyWyyvhUlmHvKAsXBCrl0didYv2x7di4HTnS7zRyryf09RQsyvw
	6ZdMcxoD+jaCZ1pNEbjFOOb7Qz8bGV/+Ff1vG9IK7WP9+ojX1HrSzqTvtAhvhqOQpsr2kjkawkw
	Fglw==
X-Google-Smtp-Source: AGHT+IFo64qe/in/Kdng7Z9+viykYzIep/glDaze3I4XSMRsdZqXl/DBVMQdd6r4eLj2Ze3mSkAUjA==
X-Received: by 2002:a17:907:7e84:b0:ae1:a69c:ea76 with SMTP id a640c23a62f3a-af91bf2f3damr584753366b.23.1754057252477;
        Fri, 01 Aug 2025 07:07:32 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af93d62bc97sm20517466b.80.2025.08.01.07.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Aug 2025 07:07:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Aug 2025 16:07:31 +0200
Message-Id: <DBR5EH6T22S3.O4U97PRZF1BI@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable USB
 audio offload support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 <cros-qcom-dts-watchers@chromium.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Wesley Cheng"
 <quic_wcheng@quicinc.com>, "Stephan Gerhold" <stephan.gerhold@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250801-fp5-usb-audio-offload-v1-0-240fc213d3d3@fairphone.com>
 <20250801-fp5-usb-audio-offload-v1-2-240fc213d3d3@fairphone.com>
 <445317ce-fe20-454c-a564-288372772b74@oss.qualcomm.com>
In-Reply-To: <445317ce-fe20-454c-a564-288372772b74@oss.qualcomm.com>

On Fri Aug 1, 2025 at 4:03 PM CEST, Konrad Dybcio wrote:
> On 8/1/25 3:51 PM, Luca Weiss wrote:
>> Enable USB audio offloading which allows to play audio via a USB-C
>> headset with lower power consumption and enabling some other features.
>>=20
>> This can be used like the following:
>>=20
>>   $ amixer -c0 cset name=3D'USB_RX Audio Mixer MultiMedia1' On
>>   $ aplay --device=3Dplughw:0,0 test.wav
>>=20
>> Compared to regular playback to the USB sound card no xhci-hcd
>> interrupts appear during playback, instead the ADSP will be handling the
>> USB transfers.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 16 +++++++++++++++=
+
>>  1 file changed, 16 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/a=
rm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> index e115b6a52b299ef663ccfb614785f8f89091f39d..d30912f952db271aa4fbc257=
0ca04b771ffef3ca 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> @@ -1176,6 +1176,22 @@ platform {
>>  			sound-dai =3D <&q6routing>;
>>  		};
>>  	};
>> +
>> +	usb-dai-link {
>> +		link-name =3D "USB Playback";
>> +
>> +		codec {
>> +			sound-dai =3D <&q6usbdai USB_RX>;
>> +		};
>> +
>> +		cpu {
>> +			sound-dai =3D <&q6afedai USB_RX>;
>> +		};
>> +
>> +		platform {
>> +			sound-dai =3D <&q6routing>;
>> +		};
>
> Because this is SoC component <-> SoC component mapping, this could live
> in the SoC dtsi.. but then 7280 is a glorious mess with the firmware
> flavors, so I suppose it should stay here..

q6afe definitely doesn't exist on the RB3Gen2 for example with
AudioReach, so yeah... I guess also the sound setup on other (simpler)
platforms can be simplified quite a bit, but it's (unfortunately) not
yet a major concern given the limited number of boards with good and
complete audio support.

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks!

Regards
Luca

>
> Konrad

