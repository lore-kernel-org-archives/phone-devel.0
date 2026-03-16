Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486423559C4
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 08:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773648185; cv=none; b=adP0+zPVCxtNvWAxf2lZgnNcHXVkY/yPmUwkg4ymTtGrCrgam40u5qDrrUwZALwkYVVUkamq35SamkuMIAJWhVcLpharOHlv9h3bBMSObF2rH5lm85AsO7VvWqpD0pajQgiWVgBFQOQ4Kt1UvCma8nVAC2wgI52Udnt1EwJUylc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773648185; c=relaxed/simple;
	bh=I3ozpn0AlufRc2Jss5KsZyj0nVqY6AoUdItpi643AQI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Py3XUaDCTxH4j8uOmpzGnZ0cidudLHR1OELnO0X63SEd1NVnimWiSjlZJQmLSU0Lf/bjpuhB7tFl9HGQQeBk7YiVZXaxK3dJ5TI0VYpjpwkY35bkRovZE2/Ollv+pl61HhGcSJf/qKw80zdlj5Z0Tx5ya3gDJhJLn4ygTbfx+IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TC477T5P; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TC477T5P"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-661d20c9787so6030526a12.0
        for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 01:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773648183; x=1774252983; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sU3L+3tbACqITsDz16andVuW8wZL35d5pmOo8PiAQ1A=;
        b=TC477T5PvaGkjcNwJm7pCqcz8viqAUum5A18ihSZaEmGWIxEvx3ewsyFaw58OamBkT
         B0Ta3lk6ieThz7uSz6TzQnsQ+u/6+/P3GsJXcxxmjQF64EisRgGDi8hVZ+06+a7/QZHd
         KY+GFQ8v1xqBJSTshlsWqiCfDmbohnH4RavHs6OSRKK/gBiKgTUBh8Jnxl0M4ZBhjEnP
         qHQCNMwlz1dkd5k4iweQt9GhdTpt8OqGpPi+GN1G6w9jOJVbFvNChsG2i95SaYbiomss
         m6hazGTRuBHQW+eshgYiqfQp+T9eEGxYynYIXH9Fza02ByhkVEbnAiGNqWIRrcmLnKLv
         9nSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773648183; x=1774252983;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sU3L+3tbACqITsDz16andVuW8wZL35d5pmOo8PiAQ1A=;
        b=VkU3oeseHaab7Di9qSkEyKcSjRJ2bS4WEuQcoQJRiUkPjNVaViiWyRznKs18J8nL12
         HtMPNpydJfX8m+xEPaAViSkJzd4BCESrn+I0yBLm+hGjIvJkrYXfd2NFG27ewU9X0ZLj
         SZ1oWuaNoAKHNuCFRuqygjoBnyOaSiVxpN+Y/CzBSnoIQgkD91CoHG0xa+WMfAfi9x9m
         up43BR1GVuwho/yDSlyujTnE9DNsEfo3ZuO+mUM2facnQ9/kKk8EJyjDiiB0pEObewJy
         w4ADS2QZKX5mm7kyvOHukJbj1Imd1lWhMWXg5AF94x6DnmFbs5pqvj78a2wDOI9DhCVz
         qoIw==
X-Forwarded-Encrypted: i=1; AJvYcCXvL9KbilrFXLkaon/t2UIzLlFxExfAakz+TqyToBhlozQXBkLn2UtZ9rcYOcYPadonrzzwjLGsWLP0ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxchIEJ/SRgMea2G6Qio26SRBVFJ/8nEZ6RZHMpBkqOl/Ghyy+n
	B3CEwFEboGWTFuOrTWk4mDLJaWe6BL9IgjeF12OHAZ2PWIdvR+aTEsSVQP5t+hEZues=
X-Gm-Gg: ATEYQzwsXyu0ar9u1vuIhzkA77UNQwU3ozTi8CDRxh217rnkA/p7vRjt4uGTZ67EmUx
	9Fakmk/fwzVmYYEgRUEtLXS845BoJKYNB3poX9Y5FNUK+L4xKqGbX8DGiTzID9xS+Ylf+nYubsq
	4kc4nrN6esAhpcmqdVQ3NAdXn92NKot58g1YL8FA0qfQ4Exau90DKSPdq0sORIOBRAkFqAAJNoV
	X01WLSFEQOuCHBrVdBlF3tajnvWFG2YPJqFY7EzQptL/VLv6KuiKBBWWkHXXhfVrFQk4MI8vucl
	atcajQSEMe6DgaP9BHiymA7msncum+RnbB2aZod1oULZGtSjWoVhHvim4PntKp4elXWBBR7YrIb
	bLU84nLv/lZ4BaitBbdmTO1jkJHVirqf1OBcfaDAYEB56v8W49PCLjOoBn+9QJqGjurbuDqrOHY
	1d5v841QShXsucGMkdZPikSPci7VAHfR6y9q5PgKHyUNv5y+9gv+S3Pnz0dwJiYN/ZDZXI
X-Received: by 2002:a17:907:98e:b0:b97:554:f12e with SMTP id a640c23a62f3a-b97650c2f9bmr622693766b.14.1773648182486;
        Mon, 16 Mar 2026 01:03:02 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976d0b5886sm504167566b.65.2026.03.16.01.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 09:03:01 +0100
Message-Id: <DH41T22PJEW9.3EO3P50QRXG8H@fairphone.com>
Cc: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Loic Poulain"
 <loic.poulain@oss.qualcomm.com>, "Robert Foss" <rfoss@kernel.org>, "Andi
 Shyti" <andi.shyti@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: i2c: qcom-cci: Document Milos
 compatible
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-2-28e01128da9c@fairphone.com>
 <20260117-obedient-galago-from-eldorado-8e0ba4@quoll>
 <cb2430f2-8601-4c72-af6b-10f1ff16c188@oss.qualcomm.com>
 <DGDV2EMXHDS3.2377AQBNDDHAV@fairphone.com>
 <DH1LC0C4QD0Y.1XKV1PWFCBQRN@fairphone.com>
 <jexys4ypbizesa3whuvtq36t6hpqm4httlbwtzkulz5pld4yul@lf3joaistvfb>
In-Reply-To: <jexys4ypbizesa3whuvtq36t6hpqm4httlbwtzkulz5pld4yul@lf3joaistvfb>

On Fri Mar 13, 2026 at 5:18 PM CET, Dmitry Baryshkov wrote:
> On Fri, Mar 13, 2026 at 11:43:07AM +0100, Luca Weiss wrote:
>> On Fri Feb 13, 2026 at 2:16 PM CET, Luca Weiss wrote:
>> > Hi all,
>> >
>> > On Tue Jan 20, 2026 at 2:18 PM CET, Konrad Dybcio wrote:
>> >> On 1/17/26 12:54 PM, Krzysztof Kozlowski wrote:
>> >>> On Fri, Jan 16, 2026 at 02:38:56PM +0100, Luca Weiss wrote:
>> >>>> Add Milos compatible for the CAMSS CCI interfaces.
>> >>>>
>> >>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> >>>> ---
>> >>>>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++=
++++++++++++
>> >>>>  1 file changed, 18 insertions(+)
>> >>>>
>> >>>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yam=
l b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> >>>> index a3fe1eea6aec..c57d81258fba 100644
>> >>>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> >>>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> >>>> @@ -27,6 +27,7 @@ properties:
>> >>>>        - items:
>> >>>>            - enum:
>> >>>>                - qcom,kaanapali-cci
>> >>>> +              - qcom,milos-cci
>> >>>>                - qcom,qcm2290-cci
>> >>>>                - qcom,sa8775p-cci
>> >>>>                - qcom,sc7280-cci
>> >>>> @@ -263,6 +264,23 @@ allOf:
>> >>>>              - const: cpas_ahb
>> >>>>              - const: cci
>> >>>> =20
>> >>>> +  - if:
>> >>>> +      properties:
>> >>>> +        compatible:
>> >>>> +          contains:
>> >>>> +            enum:
>> >>>> +              - qcom,milos-cci
>> >>>> +    then:
>> >>>> +      properties:
>> >>>> +        clocks:
>> >>>> +          minItems: 3
>> >>>> +          maxItems: 3
>> >>>> +        clock-names:
>> >>>> +          items:
>> >>>> +            - const: soc_ahb
>> >>>> +            - const: cpas_ahb
>> >>>> +            - const: cci
>> >>>=20
>> >>> Same comments as other discussion these days - I guess that soc_ahb
>> >>> serves the same purpose as camnoc_axi, so this is just last entri in=
 the
>> >>> if:then: blocks.
>> >>>=20
>> >>> I really find this binding terrible - around six names for AHB - so =
I do
>> >>> not want another combination...
>> >>
>> >> I dug up the CCI doc, it talks about the CCI having a CC_CCI_CLK cloc=
k ("cci"
>> >> here) and a CC_PBUS_CLK (AHB interface to the rest of the SoC).
>> >>
>> >> The CAMSS TOP doc (for Milos specifically, but I would assume there's=
 a
>> >> pattern) says that for access to CCI_0, I need to enable CAM_CC_CPAS_=
AHB_CLK
>> >> and CAM_CC_CCI_0_CLK. CPAS is a wrapper inside CAMSS that contains mo=
st of
>> >> the programmable IPs on there (notably not the CSIPHYs, at least not =
on this
>> >> platform)
>> >>
>> >> It further mentions that GCC_SOC_AHB_CLK is required for *any* regist=
er
>> >> access within CAMSS. Perhaps it sits right in front of the xNoC-to-CA=
MNoC
>> >> interface.
>> >>
>> >> This only enforces my imagination of CAMSS being a fully contained "b=
us"
>> >> (perhaps somewhat like AxNOC on 8996 represented with a simple-pm-bus=
)..
>> >>
>> >> +Dmitry, myself and a number of our colleagues were deliberating how =
to
>> >> best represent the hardware going forward and I think we at some poin=
t waved
>> >> the idea of putting every camera subdevice under a "camss: bus@ {}"-t=
ype node,
>> >> which would hold the reference to the TITAN_TOP_GDSC. This seems fitt=
ing for
>> >> housing the SOC_AHB clock as well and therefore concluding this discu=
ssion.
>> >
>> > How can we continue here? What change can I do to unblock this? I can'=
t
>> > tell whether soc_ahb =3D=3D camnoc_axi for this platform so I need som=
e help
>> > here.
>>=20
>> Any feedback on this?
>
> I went on and checked. No Milos's soc_ahb !=3D camnoc_axi. They serve
> different purposes.

Thanks Dmitry, appreciate it!

@Krzysztof: Could you take another look at the binding then please?

Regards
Luca

