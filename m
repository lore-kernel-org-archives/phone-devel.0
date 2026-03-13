Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF04B367F35
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398422; cv=none; b=j0Om/w3HSwxkRXN65ow6XTMyJlZsyKQ4hyB9mqJtYvV7wx/qe5QImQaaHRqri6Cio3+s6lvNSDIEJo2igIM7tFVgS9yXzQM+Jxl++sEkFiHSBdQNVmiCKUBqeXyKxuF8fBEqRoe44UrZhRRxviOLNT+Dbt5PbAlk3F/+YNsBJLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398422; c=relaxed/simple;
	bh=hy2V46Yj7werNEnar5xCstGATIYnGcBGHz9kvOo8w6w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VAs/9PyGheRIMATXWJNr+18YlzDFqZsM9YPPHBPh5xkOnHQYp6L2aKJ3b/V5gWwzB1/87A1yN4Hy7XLKx7zEVc3944r/mF9fKQymsm49Q8uCYOyF1mUvHSVfaVRD49bt31CdfRau1JX9nTYQcQGC1rhM2Zni50ANdRHt6M6gOJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cP6+zoD1; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cP6+zoD1"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9431300833so300904066b.0
        for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 03:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773398419; x=1774003219; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/LSQW+rdHG/cjFYWltT+w8Nh8WDkZ/yQlRQR1OIp6g=;
        b=cP6+zoD1nbRidnx1IcGbF97XkDpa0NSCbeP++fOzrxof10N0nBORMvdnqme6MGl71N
         aYv5OoRyCuHL0RHq2PCclakimd5H0YY1Mu9Tpux8BCW/cRfLGEZ13xr128PoZJtMP4jW
         1jzkJ9LQaYRsBWYUVPd3ipUq846bBKzlZi0dx80tgX2cn3J4T9VMRXLQgRcDuTcOIKwo
         1m3n97EOP8lNJWhPI4QgAHM3cWZjwD5Gd0g51PeHsb6aebO+y57YYhqoYfEg0tQHFSu9
         GHvKlPMUvCDRNOkZD076rZBbES0waLUTL4kexLcc2G+QCij9MAR9JH1PK0Zk17e7Dfqg
         9Pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773398419; x=1774003219;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v/LSQW+rdHG/cjFYWltT+w8Nh8WDkZ/yQlRQR1OIp6g=;
        b=clDM6haYp3ooNw0xtRQCZ38Z3vFA1p0JqzY+PM78c+KCEufODS+bmAwtuiDaO6JHth
         seNx5OfPHX4132qyyUO5F8LqapIvyRqaA6CQUFb7ZsycHwhM9Oe6ITtHSgfcNgLo3PX5
         q9kDvM1+CdEsM95HPXD4DRdzseaiNDPGVyhCrNZ82GGDcirERZo/8yGWeePidzaNrJJa
         qDeSlwKL+k3Xrm+//h4JClFOu/aq17BXDDFXbDF0TalnQaGKxXn4jLVKWWFMDhXLH5JL
         hwR+n6gN2iV9vju8cTRy3ybG9sb9+DlAP31Devr8IoHv1ORKuQOig9X85KMP3kXE1rFd
         rImw==
X-Forwarded-Encrypted: i=1; AJvYcCVkNvfjr5vGMmf2QANzWNQjmjiyn5ZiBPqVoUoutJXuy9hLD2yd0RZoSbkRLEtPJA6kzcl4k/89z6BqoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKW9b3Vaieifh+hCKYHE0QWN1UDC5KONLmf2PyOCQcQDfXRwQ0
	e+OQEWGRYk2n4LVsNgpCCvmO06crQVqz69xJRr3D9evEiOrPnDLXVJgsj7I4pcBTebs=
X-Gm-Gg: ATEYQzwcA3dXcF4iYfHS3kmf0Zc44xj+8QF1532lpOuUbJ8rOiXIdasXankp2r2sIjf
	48CPFNF6OJgiLgkOtsAiMSbowNjNfKwRwBBVvRRhuvlrI+rHx/A4uQjtagRzs3GDXeAomJ8fFfK
	zvOjc3819WzaEzrPhoUo7r9mI5WuPBmr4PL7g6YL2FFumtBNdl77HkjaBfnDs7umuZP/ZEEXDk9
	Agm6gPW/+flWYxUmwqkts8JSzmSY+wLZqyvNXOH1Btn//+ExtbpBBvQ+XrJcB49V/EG0l5g9zmU
	Ovkaz1iL6CRoZGNGvt35qr7k2QYKbrXMUWgVyrHOXV3t9Ku/L4F5SPBrjhYoSpK4Y/ob3c+YFBp
	3/tfaMCyUIUWwWOVIMfOwP1AeL7mpo6zLvLWY4I+oRDado6FrR2LK9DlcUj8ANQz3e88S/AsWXL
	ObGniHcEIMRxV+hlg0ax9TDMjutPIdMVYN/HqOR4+4oMVsV94gNuOsm/ZSY/uyq0r6vzhn
X-Received: by 2002:a17:906:7db:b0:b96:fa3d:c8b3 with SMTP id a640c23a62f3a-b9764fc9c64mr125909366b.9.1773398418844;
        Fri, 13 Mar 2026 03:40:18 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cba6e8bsm36432466b.6.2026.03.13.03.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 11:40:18 +0100
Message-Id: <DH1L9UD68SKL.21KTH1XGR724Y@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Alexander Koskovich" <AKoskovich@pm.me>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-4-27b4fbb77e9c@fairphone.com>
 <52fffc84-2fb5-47aa-835c-b0dd8c110d59@oss.qualcomm.com>
In-Reply-To: <52fffc84-2fb5-47aa-835c-b0dd8c110d59@oss.qualcomm.com>

On Wed Jan 21, 2026 at 12:52 PM CET, Konrad Dybcio wrote:
> On 1/16/26 3:50 PM, Luca Weiss wrote:
>> Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
>> parts.
>>=20
>> Thanks to Alexander Koskovich for helping with the bringup, adding
>> 'clocks' to the PMU node to make Bluetooth work.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 174 ++++++++++++++++=
+++++++
>>  1 file changed, 174 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm=
64/boot/dts/qcom/milos-fairphone-fp6.dts
>> index 52895dd9e4fa..cbe1507b0aaa 100644
>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> @@ -24,6 +24,7 @@ / {
>> =20
>>  	aliases {
>>  		serial0 =3D &uart5;
>> +		serial1 =3D &uart11;
>>  	};
>> =20
>>  	gpio-keys {
>> @@ -215,6 +216,67 @@ trip1 {
>>  			};
>>  		};
>>  	};
>> +
>> +	wcn6750-pmu {
>> +		compatible =3D "qcom,wcn6750-pmu"; /* WCN6755 */
>
> I think a fallback compatible would be in order, if the data matches
> exactly

That'd give us these changes

milos.dtsi:

    -+                  compatible =3D "qcom,wcn6750-wifi";
    ++                  compatible =3D "qcom,wcn6755-wifi", "qcom,wcn6750-w=
ifi";

milos-fairphone-fp6.dts:

    -+          compatible =3D "qcom,wcn6750-pmu"; /* WCN6755 */
    ++          compatible =3D "qcom,wcn6755-pmu", "qcom,wcn6750-pmu";

    -+          compatible =3D "qcom,wcn6750-bt"; /* WCN6755 */
    ++          compatible =3D "qcom,wcn6755-bt", "qcom,wcn6750-bt";

Plus 3 new patches for dt-bindings, with commit message something like

Document the WCN6755 WiFi using a fallback to WCN6750 since the two
chips seem to be completely pin and software compatible. In fact the
original downstream kernel just pretends the WCN6755 is a WCN6750.

Does this sound okay?

>
>> +	bluetooth_enable_default: bluetooth-enable-default-state {
>> +		pins =3D "gpio53";
>> +		function =3D "gpio";
>> +		output-low;
>> +		bias-disable;
>> +	};
>
> Not sure if we need to drive that pin.. perhaps a pull-down would
> suffice?

I'll give it a shot, this pinctrl is coming from downstream but perhaps
the downstream btpower.c driver is differing in behavior to the upstream
PMU driver.

Regards
Luca

>
> [...]
>
>> +	bluetooth {
>> +		compatible =3D "qcom,wcn6750-bt"; /* WCN6755 */
>
> Likewise
>
> Konrad

