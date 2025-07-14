Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EB12459F7
	for <phone-devel@vger.kernel.org>; Mon, 14 Jul 2025 12:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752495587; cv=none; b=EdcPpfpLs1ufJQfD9SYA/IK+qb5+sxZsv2Dv+SHXqNMNIVwKHGecAZGlHl5VVe6LSrqlzDpCUO/ryFjATMhIZNk2QMTvBy8c2JXg/sSBUnNcQ/iq+FwE1VvRKEPi+9umOfE/5H6PcNNB2uU+MYw+t4j+qy1NYD4v67TED9q0wSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752495587; c=relaxed/simple;
	bh=vg1LPvtok41V62jKgVCViQqz2vZuvfhY4dzciIbvWQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILk3yUK0N3ByUrYgkOCFXCkQHhSrAs4i5in349kvr80d/jhF5rQkFzC/kwiFZ/5vj75cqQpdv9zUJFeFPRl0i25Mainl8BmFbUaGiZcU9uYIBQSRfte8qonsMZ+jNgeZyxgxy5T953OLHYmi0WaWxRUz6mSqAo8Vqq6pLnOD2wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1uRVocu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E1uRVocu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9UpGX031774
	for <phone-devel@vger.kernel.org>; Mon, 14 Jul 2025 12:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	to+jAqKUwFsv0AkY0GQhPmlDuQ5+LAk2TMq6Z7FQa2s=; b=E1uRVocuyHFzbOsE
	SDOXrepOxttpPH3XsT7PdQ7+jLPEu7tD+Jpmzx1aIJ6UQOKjYW00inJro8y5rIzS
	Hx2PrhXS2FOqeo+g6j0Z9S13BH3dLGvjK8C8Vssh/E2Jyy1biYQvnFdafuUTxYzG
	PJR9dtqhXuuFM+6bip/DFAgMsGiprQBNz9XSHaU99RAw7D++zeXCZo8C3meXl/E3
	sMTN4UDkxV6Y7d6jX+cSasFcGY3u2FFrvS3DzRWpWsllC1jfMb39ccmMQhljPi1h
	vnUjNpph+H/NkD7/pyLbquKzOVqf4RGuBm/OmBcy2flVbY9AC6Gr5e2byhAmwJRe
	XFJLTw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47v56a36tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 14 Jul 2025 12:19:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7dea65840b8so34721685a.1
        for <phone-devel@vger.kernel.org>; Mon, 14 Jul 2025 05:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752495582; x=1753100382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=to+jAqKUwFsv0AkY0GQhPmlDuQ5+LAk2TMq6Z7FQa2s=;
        b=kE+Odkq4Yc/bzWgKyHOYX7PCM2fiKJaj3huYJLOJYnDjnMd5XhyVwnoJ/JI/97Dpb/
         /muiI/kCrrBdtrjXT1WiOwMOA0F4gkDz9Io4NWM5Z9XFTGK1awJfuiPiBMtrALLmPM5Z
         tZfQJH23ZEc66AmpZSLUBUYUw6MGz5G0RZrkRfymfaESinNim0ZBgi/4ZrhHsXNYxCk7
         nZke9KkhUtK3/15im1vztcWojlFsc91qEwtZGWmuquHzv9CuHYofaEhHajxgmgeMnEUy
         22Zz91WLoQYiuJJqD+6bP2NnvZo4NKg/4k0XyjQdMxs7gqmpwblWN/EpcPOC6wbvA4hf
         hZ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtwAB+qXedNRxXwXQwvioyqLt4AuZOCAJK5ctknM38W3YaIVFsA5CXECRrRONk8wtXNCcIhGDgtnK6BA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAo3CmmZhW+JnXtXlxvUFuSJiGyl9uYm7PssK6FbNH+2WEkUqT
	Hr1zxv24CQecZBh3MV6lFXpHhelG4qt9j3a+k0dEGH/JsSKix0xYskVR+MKje5NUOR/5LQMSapr
	dniAlKX81ILxqVZyPhiCXzlQKC943k2cYOvgUUiFMMfGd0lM2oY7xld1kKSEv4wuyLw==
X-Gm-Gg: ASbGnctH8ZbjxvddoEaIDCDYE4P1C8/K/YEMCa3J2+DbBrf2aGnw1SXh6b6HM0OfDGt
	6jzZ5oaLfTs5fwIKTx7yNuCACAnkGa7pI5/c1fb43+LbXGKEtqVPnWtjKwuDnt0F4Z5Kq9eeXZ/
	MZm8FflYcgpn8LzcedhwJ+ypKfRw+4TAsVw/4XW1YywPjlhnTJGMF1f4Fp2SkSDeZyZIcEEc8b2
	zjJ+g3VzqpcOP8ivkVRYmxzZJ2iN15zy5L2rFErK6ze4LklhlTBG1GoijjCkJX/6z0R5Z4Xr+qG
	x3KbEERlpT12suAKSYYr5ExBNJHKirx0lbk2CxdqhfwRQJWgf0iReaQHQbOQPg6gOij4SbHv4hK
	zmhIaWI6ySYG09m9N6Ejq
X-Received: by 2002:a05:620a:4514:b0:7c3:c814:591d with SMTP id af79cd13be357-7dde99543ccmr786278085a.1.1752495582254;
        Mon, 14 Jul 2025 05:19:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/vV+coe8tEVfro7qq/0wCJ9/o2FTg1Dgu/ZwIOZQR1tYnvSopD2hrjhYTvFm/GsULL9+YrQ==
X-Received: by 2002:a05:620a:4514:b0:7c3:c814:591d with SMTP id af79cd13be357-7dde99543ccmr786273785a.1.1752495581726;
        Mon, 14 Jul 2025 05:19:41 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c9733e9fsm5990826a12.52.2025.07.14.05.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 05:19:41 -0700 (PDT)
Message-ID: <6f8b86c7-96a5-4c7c-b54e-25b173084d95@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 14:19:36 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] arm64: dts: qcom: Add The Fairphone (Gen. 6)
To: Luca Weiss <luca.weiss@fairphone.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        Thomas Gleixner
 <tglx@linutronix.de>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-mmc@vger.kernel.org
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-15-e8f9a789505b@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250713-sm7635-fp6-initial-v2-15-e8f9a789505b@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cj8D0_z4xef_7NMPrNgk1EoiFBzKAMlO
X-Authority-Analysis: v=2.4 cv=X7BSKHTe c=1 sm=1 tr=0 ts=6874f5e0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=ZwcaOx7IXxPg4YioGooA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: cj8D0_z4xef_7NMPrNgk1EoiFBzKAMlO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA3MiBTYWx0ZWRfX0k9qBpksNi6V
 H0KoyMKlSAgjKiCz8Ztl+98LVl3Ag9TibIjD8aA+FH/B7ix/kiaDui04gStCf1LHTSE0HQum4tA
 7Rs1c8rsQ35030zo+YacQDk2G7Oy+6nvZVjg4eWc8//RjoYbS3alxTxylFFBXp1oKJHf9fmvUUT
 ikc/TAAnvPz6Lcgb9hZBpFE0DT0BkilZNyW7QjNdNIrmW2ZLwMzxvxhhtHID7O/hb7K5maMbDlf
 lh7Eagcv0kJGuc4HEdg03GftBHRnVdSqL4b+lFZaEB/Jt80cWvyW5jSryhLKqLGMEnFhNgnfknQ
 ltDWw5ckiR0rbExQ5peNzcv/C2BBVBM8jv6sck7xLOo5EHSJyQeS5W6mM4EJa/izM9+DgVVsxp7
 yzeTddDppSKnwNk8miVGihnP9n+95KPY4yW25dJSMkFOX/HIQd5Z0y/ZQRrPU6ExY5WN068F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140072

On 7/13/25 10:05 AM, Luca Weiss wrote:
> Add a devicetree for The Fairphone (Gen. 6) smartphone, which is based
> on the Milos/SM7635 SoC.
> 
> Supported functionality as of this initial submission:
> * Debug UART
> * Regulators (PM7550, PM8550VS, PMR735B, PM8008)
> * Remoteprocs (ADSP, CDSP, MPSS, WPSS)
> * Power Button, Volume Keys, Switch
> * Display (using simple-framebuffer)
> * PMIC-GLINK (Charger, Fuel gauge, USB-C mode switching)
> * Camera flash/torch LED
> * SD card
> * USB
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

[...]

> +	reserved-memory {
> +		/*
> +		 * ABL is powering down display and controller if this node is
> +		 * not named exactly "splash_region".
> +		 */
> +		splash_region@e3940000 {

Was it not possible to arrange for a fw update after all?

fwiw the rest looks good

Konrad
