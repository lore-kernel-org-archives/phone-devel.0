Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A2637BE8C
	for <phone-devel@vger.kernel.org>; Thu, 29 Jan 2026 08:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769675579; cv=none; b=Kkgt3lynaKecdsbcke20JszR4dISenolApm/eFaMG/txAYfWSWYpNOC11/UCM5rczRcqzcXJeOuPk/56o7tSKhtwKQuC/SrdCyMJ+uBGW2wf7DvhWgaG47RTv9OIYpd02TxGxtv4XaO5uLNy+kUQxACfm7O/ka0RfikpstsY+ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769675579; c=relaxed/simple;
	bh=f1GxHtLA5dSfXy2NJ+XkS6cb4bnCDot1iUR59DpR9nI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KAOlh3lT6hjOLdxCuPu8b1Y9oE1jT2DHD5rN8PBjdhODSFlKV/KaAfhHQJRlbtkKJzpR01F846NMbtBUODBzHaQBXF9LdOIg2++mjUKUEZ/pDGilC4SRopOk5P8QAW951D/l1Zr85ExlbaETuR/R6W1rcu4Xe6wVvWREwTvWItY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nibbBz65; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nibbBz65"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b885e8c6700so122555466b.0
        for <phone-devel@vger.kernel.org>; Thu, 29 Jan 2026 00:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769675570; x=1770280370; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaxUdD0qwQbZkk4erIr/YJtf7yeY/WCaddsKbD6XYuw=;
        b=nibbBz656o83NmT6mrloXtlpnlyhz3DhmOQ8fConLPwk8TOVQukpZaFQaQU3JJZg2/
         UKkHK7gwneRZzHFW3P99sFMCngSpJEV7SbiePeMN4fwfGgrTlHggmni6DKUS2eGLdVF5
         KpDxwwgb8n9OuhEWwQ3KllJUX33AwiC90xms756MwU5ul+9o90R+wxHQP6D7CW+dvvDV
         9M6rliQV5lIbBakyN2pqk1yI/E7mfJ6cqGgANiJS+WuNxGwAo9aMpTe36l5lyzdgTnuF
         iKlOcSSEfpw5DNfVrssJo3sS/td1Xa3tRJjvtlmXVwdtVKTB7IqSjCljZP8V8E8aWKOz
         k73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769675570; x=1770280370;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XaxUdD0qwQbZkk4erIr/YJtf7yeY/WCaddsKbD6XYuw=;
        b=V3o2ctYcm89rLJXQQSP3fQwY0Dwd8k371ec1mhdz9zVbq6sv4OFQ9pf+lh3MzaURW2
         zSMX7bzsNkz9z5LFJxU8RJks4zyKAVU8raXOZT1fJ0D/3wpOSIn0RJd26s4HO+Vr4ajn
         1WX5bsJe8qXf/jm6AWHMVbbFoOMfFEt3EOp/Qcg7TpXd0ZCgqFfMmIXNGYCyt6VXpSXF
         8EMBiUZwG/qFqeMnwq60l3HZ3txUXzRxDXbPW705TNnfM/DhU2RovfDzc2GazQmjE7QG
         9clEJS9phyn+BxJaKL53oozgnHz5ZnN8hc3SeOYmbVZXxIlq0r2rv6AE6L0ZRxam6YBs
         DZvw==
X-Forwarded-Encrypted: i=1; AJvYcCU5kmEEZyqB5bCRvCTT0ToBwjP26al4Qog6GvE0B8C+4U30jQITy53yWcfkPnlNfdLLx1sTozW3XOsgMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPqp5yw2c6Ao8qXdmNzS+2MlL0xe9NSDWmN9aDAvxu3XViBDOO
	JeSdpUspB+SiiqChJr78UeySWWDdazytb3/bpqzf04n1Vl5m6gIjXRCAIPt7YeYlYCc=
X-Gm-Gg: AZuq6aLdlhkpJk1LkIUfQ0XEa0H6tK5Vva3hPrz+CNiG1jjaJtLba4WD+l1i/2inUed
	ctUUtqHZ54x+WJBNZv8D8Y8hQY42JKyujvFkGP2nfirgvqltLTvriuPY+j/F+Mg/MReHZd5nt0F
	U2xtBkS22yiirJvfRK7KYO/qQ+xnWOQABiMv8Gb/cTd+q66sT2iZDXhotQdfnKN8ssOiGVWUd+M
	YNTrsBh9FZ11RT7cO9GfjaoP9n4sBCcA/eE+JNrKJQ46GR4NTOy6hz1/UW92ZtV1fkmpxbvBVNv
	sjInadJVsvhZjgN0+V9QglgrG0dGz8I4a6nWu2E9zXqOKf1hE6xcKsbcrvDUWZ02jLMRVimO4AH
	J4TBbDiFexL8D2LaXSNejiGgf6yfQimj8K7ocsKC15WRXk8kffuM/E0/8eANNr1jfBqlsp04RSg
	MrFPDjjCndG3PRyRqWF0z7xNNH+4fdv0g7ptDRMJEmDkzMoLP1+M7tsC0g
X-Received: by 2002:a17:906:c10d:b0:b84:2fe8:b5d8 with SMTP id a640c23a62f3a-b8dab2d6bb6mr578618466b.14.1769675569833;
        Thu, 29 Jan 2026 00:32:49 -0800 (PST)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf183cbesm224977466b.38.2026.01.29.00.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 00:32:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 09:32:49 +0100
Message-Id: <DG0XMT4TZKCH.HPXGS9YTG9FA@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm6350: add LPASS LPI pin
 controller
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-4-36583f2a2a2a@fairphone.com>
 <d3upp33rbn66ioxpc65n7uqwz32kxghzue2n3dkd5k4lch3iwg@qgcppndlte5a>
In-Reply-To: <d3upp33rbn66ioxpc65n7uqwz32kxghzue2n3dkd5k4lch3iwg@qgcppndlte5a>

On Wed Jan 28, 2026 at 11:16 PM CET, Dmitry Baryshkov wrote:
> On Wed, Jan 28, 2026 at 01:26:52PM +0100, Luca Weiss wrote:
>> Add LPASS LPI pinctrl node required for audio functionality on SM6350.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 66 +++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 66 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/=
qcom/sm6350.dtsi
>> index 9f9b9f9af0da..b1fb6c812da7 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>> @@ -1448,6 +1448,72 @@ compute-cb@5 {
>>  			};
>>  		};
>> =20
>> +		lpass_tlmm: pinctrl@33c0000 {
>> +			compatible =3D "qcom,sm6350-lpass-lpi-pinctrl";
>> +			reg =3D <0x0 0x033c0000 0x0 0x20000>,
>> +			      <0x0 0x03550000 0x0 0x10000>;
>> +			gpio-controller;
>> +			#gpio-cells =3D <2>;
>> +			gpio-ranges =3D <&lpass_tlmm 0 0 15>;
>> +
>> +			clocks =3D <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_=
NO>,
>> +				 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>> +			clock-names =3D "core",
>> +				      "audio";
>> +
>> +			i2s1_active: i2s1-active-state {
>> +				clk-pins {
>> +					pins =3D "gpio6";
>> +					function =3D "i2s1_clk";
>> +					drive-strength =3D <8>;
>> +					bias-disable;
>> +					output-high;
>
> This looks suspicious for the clock pin.
>
>> +				};
>> +
>> +				ws-pins {
>> +					pins =3D "gpio7";
>> +					function =3D "i2s1_ws";
>> +					drive-strength =3D <8>;
>> +					bias-disable;
>> +					output-high;
>
> The same
>
>> +				};
>> +
>> +				data-pins {
>> +					pins =3D "gpio8", "gpio9";
>> +					function =3D "i2s1_data";
>> +					drive-strength =3D <8>;
>> +					bias-disable;
>> +					output-high;
>
> And here.

I've taken this pinctrl from downstream lagoon-lpi.dtsi. There the
active config for these pins have "output-high;" set.

And fwiw this pinctrl works fine at runtime for driving the speaker.

Regards
Luca

>
>> +				};
>> +			};
>> +
>> +			i2s1_sleep: i2s1-sleep-state {
>> +				clk-pins {
>> +					pins =3D "gpio6";
>> +					function =3D "i2s1_clk";
>> +					drive-strength =3D <2>;
>> +					bias-pull-down;
>> +					input-enable;
>> +				};
>> +
>> +				ws-pins {
>> +					pins =3D "gpio7";
>> +					function =3D "i2s1_ws";
>> +					drive-strength =3D <2>;
>> +					bias-pull-down;
>> +					input-enable;
>> +				};
>> +
>> +				data-pins {
>> +					pins =3D "gpio8", "gpio9";
>> +					function =3D "i2s1_data";
>> +					drive-strength =3D <2>;
>> +					bias-pull-down;
>> +					input-enable;
>> +				};
>> +			};
>> +		};
>> +
>>  		gpu: gpu@3d00000 {
>>  			compatible =3D "qcom,adreno-619.0", "qcom,adreno";
>>  			reg =3D <0x0 0x03d00000 0x0 0x40000>,
>>=20
>> --=20
>> 2.52.0
>>=20

