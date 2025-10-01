Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7DB284665
	for <phone-devel@vger.kernel.org>; Wed,  1 Oct 2025 08:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307437; cv=none; b=MmEZ+biDfkHrvMkS6/6ied4htbOpCF+a9EPOU+hFWteBUe+OiEJFJzNMev+O2BmWaB6pu9xXVmf/ReB2Vn6HkGvdkuolNhdVfqtD2UT7I5Bkjt6zkduK3Pq5MGQS86YMqVftljnzbPTGPnsUWfwpdKu/qoukk9v2eX9bKAsKtgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307437; c=relaxed/simple;
	bh=aTV9DJ4X7CNRdvh2CbVxN/SzInF2XKP4CHkbj/CtYyI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=NTB83HvC+lus+kBQ1nA6UoXPmlg1FSI7tHWDytdcZQbRuYpxfdzUEZq8jPvoemoFVcBxZ2zsg2AZMSYhO8Rfj6EJ+nhC4ws7mSXx1LGQvVynTmwJADX8U/2XkYSaz+Rp2GNRF465Mbz/jAgyQBxnppro+0YC3PsC3dlq+WWCLnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jXr4/wlO; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jXr4/wlO"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb7ae31caso1023781166b.3
        for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 01:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1759307433; x=1759912233; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sp5MBlUIUhjs/PyEtVVLwD5jMkZMg5ArpTjJ0W4Ld0=;
        b=jXr4/wlOXPJxJVUtIidlhK0+XB9rgQV5Ai1Op2CnCYjL6+RGJwFnfSQlxEQCrkzrRd
         kU2RH1w8yJjR0u5BfNTtqpA+XqHpFC/a53srwMkx5I3guA6Xkxz4+SCvomLZN99W1j6C
         D8vdspdxjUvTMyOh9LnQEvMwHSulpVpq6Ejf4ledMzE4nPcXD6n2/BiZQ362bSIhJSjZ
         fXrzXugNEx3y0piasPKI7GBe+HHwSXGTnfaWBwBcTxTgcuNJhtCTGEtfE+Ev0QUwuTWN
         78sjxRuiWXu1laj9GWbwsZfupMfc9hqtDtzmqv228uMGr+se+fVf5aXIc3yWBnTDZFlu
         5KDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307433; x=1759912233;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4sp5MBlUIUhjs/PyEtVVLwD5jMkZMg5ArpTjJ0W4Ld0=;
        b=fB5Xzyc3eaHrGX7TJNFDq3AP5VdvMfmU8kSsxDXMkmhtwLbV+EtmzJWqVTbwKzPl54
         GO7jBa173JoDTyB8dxz2ms7v057GMcKLjWC+GTnwiOYUM1MWLrPKam22FRAnDsBDFZKS
         t9/8t8yEnTv5shOIZRBgbc9tcXJ5g4KcaJWrK/dzc0DR5q9sorR4n2k4Bjcl1eK+US9S
         7PT+UZzdOhhgLY7B/IoyThHrmK9Bx2BZB5gyR2/E2loPzvbBWOthWlU+UHP738z8othx
         blRx6z5gKsp9NzljXlvpTdO6X4pTRCNO4Xk75nQ34hXpbPO98FYCRSUTa2t68UTCPfQh
         X8ow==
X-Forwarded-Encrypted: i=1; AJvYcCXg+UB/U7GfzS9q76hHuguq1Gr8Elcp1PSuKyhh7pCNyOhw45cEp+v8zKOWmEK1PvNhC4DJVcn1nsSujg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwkU/j8ACSCL2LNn0Wch5Guu8gKU/ESSpUVJDI02rXkDPiPuFw
	/0lMlvBge6/RpWpYaqwsZGz05wJHvBu0SD8yEVxAs2k+Hv1avU78o5y6F1/xvbwujCM=
X-Gm-Gg: ASbGncuUUJtiIgII9+aWdn0/OrEkMtrHsIxlo+66zk6kCW4n3nsoGiPpkN6LiCSVMrq
	dvWjMiXxZdps2tyQiZWHnZ2ly/ziSKDyfaVoZHdBFtkZd82B0/M8eGVd7xR9Xu5j4Z/O1xh8AYY
	he+WgsyZI1qXWeFh6AXT4Fi+cMVGL/zqW5nl22OF6PlDbtXLUvd1AL7j9gDbAHEzWDSIkAs4RQT
	lDZpiVyb5UYzyjiMyfh19tKf6Mc72CzYzbGuuitc2lDXWD5w10vjKbn0rBop5cCSJBX6q1YI6UQ
	6FI8HvGtaVIhMO9tooo8k9KkEvDYDUzq6DmZ9TZIx74L0vlXlV8KUdr16bmgVAKfU6VuAPamqbo
	Ey58Yy7GfLus3KuqK8SQiWSvPLNIn3jlUNQhy8x7GokCf6hARro5x1+9KjMNd1nPIJ2ryeBPdA5
	kQw/sxXfQfSRhkhJe7
X-Google-Smtp-Source: AGHT+IEo+e2rUvArQhzF5eV5Lh+i9AY1uOMcpk2GIpqm4c0ralkRiKHWzmcmVJzcPnQvOl2COH3sJg==
X-Received: by 2002:a17:907:9709:b0:b42:f7df:a2ec with SMTP id a640c23a62f3a-b46e4b8f700mr308378766b.9.1759307433006;
        Wed, 01 Oct 2025 01:30:33 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3f1b54c4fesm566437966b.86.2025.10.01.01.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:30:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Oct 2025 10:30:32 +0200
Message-Id: <DD6UFOT1KRFG.3M6QJRGYRAJF9@fairphone.com>
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcm6490-shift-otter: Enable RGB
 LED
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Casey Connolly" <casey.connolly@linaro.org>,
 "Alexander Martinz" <amartinz@shiftphones.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Luca Weiss" <luca@lucaweiss.eu>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
 <20250930-otter-further-bringup-v1-5-7fe66f653900@fairphone.com>
 <fc5d2d9c-7200-416f-ad89-4c1907e313c9@oss.qualcomm.com>
In-Reply-To: <fc5d2d9c-7200-416f-ad89-4c1907e313c9@oss.qualcomm.com>

On Wed Oct 1, 2025 at 10:29 AM CEST, Konrad Dybcio wrote:
> On 9/30/25 4:32 PM, Luca Weiss wrote:
>> From: Luca Weiss <luca@lucaweiss.eu>
>>=20
>> Enable the RGB LED connected to the PM7350C (PM8350C).
>>=20
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 27 +++++++++++++++++=
+++++++
>>  1 file changed, 27 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm=
64/boot/dts/qcom/qcm6490-shift-otter.dts
>> index 36cc67469615974c193ea3a9db1b2362869d56bb..b4c69dc50ed0f0b3cb45341a=
01c89210bd261993 100644
>> --- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
>> @@ -632,6 +632,33 @@ led-0 {
>>  	};
>>  };
>> =20
>> +&pm8350c_pwm {
>> +	status =3D "okay";
>> +
>> +	multi-led {
>> +		color =3D <LED_COLOR_ID_RGB>;
>> +		function =3D LED_FUNCTION_STATUS;
>> +
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +
>> +		led@1 {
>> +			reg =3D <1>;
>> +			color =3D <LED_COLOR_ID_RED>;
>> +		};
>> +
>> +		led@2 {
>> +			reg =3D <2>;
>> +			color =3D <LED_COLOR_ID_GREEN>;
>> +		};
>> +
>> +		led@3 {
>> +			reg =3D <3>;
>> +			color =3D <LED_COLOR_ID_BLUE>;
>> +		};
>
> I assume you managed to confirm these mappings are correct.. sometimes
> they are not what you'd expect

If you mean, that red =3D=3D red, green =3D=3D green and blue =3D=3D blue, =
yes. The
RGB configured from user space matches the color on the LED.

Regards
Luca

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

