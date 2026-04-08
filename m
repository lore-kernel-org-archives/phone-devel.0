Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7FD39D6CB
	for <phone-devel@vger.kernel.org>; Wed,  8 Apr 2026 08:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775635887; cv=none; b=To3Vxd6G/Of5TR0WF9B8buNBf1TJPjEndkfblz00+zFHcN0uZ0u64IlXxFCCx/vDVJJXLHRR/dKRcvRCZLFYtIUcvV6QcQWF92jhR2fWRhMGAw9Mu2CAksXKl6JUYhHuWWduOYNQg+KS1cWCBR4agXgQV+D5xMxeLlKGqiXVtg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775635887; c=relaxed/simple;
	bh=qK0XOhdUp8ewL5EwkKLZy+s840v+LEgMIWvVBSzPG1Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=srCF/JtsOYXK8VPjXLG9Fz02iy0R2yal1O/mmbk9WGIsz8pKtrLFmaKcsJV6utXEOKtIWvgBLIYQROqK0n2xPs8p5/BmJEIaZ5GGBMvSuj75Urvv2ZdB/wIxv+zHP63ymp/MLsCva4bgsuI2pZZtxoEXygvBICnif/r5uPyWBBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IFV1Uasy; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IFV1Uasy"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8f9568e074so1014192866b.0
        for <phone-devel@vger.kernel.org>; Wed, 08 Apr 2026 01:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775635883; x=1776240683; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XS7jjiupqdwNkh5OVoHcVKRKm0KpURxAwvyTzn+V6qk=;
        b=IFV1Uasyu5dKvZ/kbi3oSrrcuNBV6c44rIuZRFJHMQkeu3DzNZYMlWd1tHOJeD9Y2n
         oWmvlk+kJVL803bJIcsYduQI/QIgfPM4U+AcfrIMdI/35hufJeVF79Il5OnPQqDVzWrC
         vt6gQTn7rM5T9Ev0DDbS9m/dI8Hkol+OEt46FFQ8S4WpUDEQ/XSbS8Swg3fdes9KMLfz
         0g7tq57LWUbmk21doLWlDjGd0IKr/RmgzY8/NcpQwoRrOy6Pe00I3bzdC9A/Fjc1v9VD
         3xhL5b4EDtx3CeUBDTF6gMkcaDxHDTseL4Ch6Ab9Xfsk0668G7yvin1SimYIsFu2BSmW
         BS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775635883; x=1776240683;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XS7jjiupqdwNkh5OVoHcVKRKm0KpURxAwvyTzn+V6qk=;
        b=Bw5QC8XDlWSiq2gH0y0s/e1FNjHVhqN93Bi/4ShPOG/uvfl5POv8STiYRwKikmExYQ
         gcqQjwqTErQxL8ultNGGmt/9f8gh25OxJViFQSCebF0b3Tcm42YBmFiICqRBNrES8qjE
         BYLN9wRO7+l5uGCs0TY/VbHL9G8UqkoG7A2LXpd/hcaXqEhsy69w5qHSSGrrtAILoRP9
         U6uynW0tFDCar78ZZx/lKH7zAPDk7OdzNkvTzbEIVfrwUUi7HDxW15K8MIE9JSIsNaGY
         Dr/dpd5ZKSmuWc5HQuj/XRq7fVEjj8m48U4Ec5GkInPrK1d1MxOKhGkaeyft63HFOjxv
         6Y8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvAeaQmiw8ZunA4OqAMmmdUEyj8E5EnU10fKo7qgUC3uwF3TXjbS1iaS5/Tp4gkFyE8LRaFNCyBmzXHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb4ef2lUAltbM3sJbHoB6NjrGREWidDvxW6LKgWVJXneYZpuO+
	66I2YBqESjYiMtMvUDKU6ibblZKa1SIt2kS2aGyf4mPS/51nDwUXH0CiTBo06RNMSOk=
X-Gm-Gg: AeBDievh7BWHRa2LZSwZiBwAXd4sKn90g+BiprW6v4YDdQlyE43VX8IYzMkkbeWk/SF
	dKsiKnchALgVJoPrJJAIWXfki+djSXHfiuP7s7KqFwOPXEGuBXjiuNcu5QCvyv53I7ODcCqiI3C
	cijIkRwuMFOdwOs00mhz0EaWVBFaxWhtbeWmjJuUa83fz7S4+Recspn9KvU9qjYWLIUgfR2k+uP
	O+35ghoNmgz1dBsgISXltTD4xazkUd6cISmyO6eXFB/mDXeo1ATsn9hD856Sdn2pPidky7/wExh
	4CZUW6AA2/Qo14vU1nTjfJVMpS9cPgRDXywqy4WkuVUd6bDfcyUx82YsSK7+qyWRBk8fSZAm7Xl
	DGGwNGMOTiUz9Oe872pSypciFWThsfbKxMu3GY9ISZeGU8dcK+BhqWxS8eVmkN//V44OA+RYB8E
	IRdxqY+GIcfbSIORFlA/Fn3tUGUpfzFpjyWAzr5IDqg76VzeoCnb0UMRXQPU3FQgAVqWwR
X-Received: by 2002:a17:907:9302:b0:b9d:14e9:8416 with SMTP id a640c23a62f3a-b9d14e99155mr231127466b.37.1775635883060;
        Wed, 08 Apr 2026 01:11:23 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c574041sm634897066b.0.2026.04.08.01.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 01:11:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 10:11:22 +0200
Message-Id: <DHNMDZ7M0BVS.36Z923XKNXPEC@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: milos: Add IMEM node
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260407-milos-imem-v2-0-5084a490340c@fairphone.com>
 <20260407-milos-imem-v2-2-5084a490340c@fairphone.com>
 <20260408-adamant-hairy-galago-61deed@quoll>
In-Reply-To: <20260408-adamant-hairy-galago-61deed@quoll>

Hi Krzysztof,

On Wed Apr 8, 2026 at 9:34 AM CEST, Krzysztof Kozlowski wrote:
> On Tue, Apr 07, 2026 at 05:11:11PM +0200, Luca Weiss wrote:
>> Add a node for the IMEM found on Milos, which contains pil-reloc-info
>> and the modem tables for IPA, among others.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> Not happy about the names of the subnodes. pil-reloc-sram is not allowed
>> it seems. Glymur calls it "pil-sram@94c", not sure this is wanted?
>>=20
>> Please advice.
>> ---
>>  arch/arm64/boot/dts/qcom/milos.dtsi | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/q=
com/milos.dtsi
>> index 4a64a98a434b..0c69d5810f5e 100644
>> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
>> @@ -2289,6 +2289,26 @@ scl-pins {
>>  			};
>>  		};
>> =20
>> +		sram@14680000 {
>> +			compatible =3D "qcom,milos-imem", "mmio-sram";
>> +			reg =3D <0x0 0x14680000 0x0 0x2c000>;
>> +			ranges =3D <0 0 0x14680000 0x2c000>;
>
> Use hex here as well.

Will do: ranges =3D <0x0 0x0 0x14680000 0x2c000>;

Do you also have a comment around the name of the subnodes? Do you think
they're okay as-is, or should they be changed?

Regards
Luca
