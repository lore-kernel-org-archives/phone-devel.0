Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC70E223DF1
	for <phone-devel@vger.kernel.org>; Thu, 10 Jul 2025 13:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752152591; cv=none; b=rFPA9sV7b66LfVOhqwso69IMuIaWah9WV0bKGL8PU3693wRBRshH9BE3dxUl4we31nFw66z+3JSFAGXTt7waJeHg53SGqfAUx+TYHX8Fp6Hm4qI14qXIuJK2Y6i6RqFIB0wOcY7iTFuec2hkyhB9RFb7gX3omSdnplCd5ZSXVKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752152591; c=relaxed/simple;
	bh=pUgs9tQcuNvknJfrc6tNawtLAtGlb9im+k1KY/2C5hA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DRzWjy5bqWJnjpyc31/5aMQu4pCHvdtFvemlANgJlaOlaDKjMpX4jB/3POGAuau6XR1KQBsQRokHgH/2BhldHVOyjp2bwcTjRGJq0zE6/ZNY6oD10rqfCKEFjeZjtOc/zG2S1jbdOL0fMwZOPDLNcAri8Nbv/BuJD3fvY+o7y1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=alep1I3v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="alep1I3v"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A82Tmp024481
	for <phone-devel@vger.kernel.org>; Thu, 10 Jul 2025 13:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hjPwmWtX19e7Bo1S75MfSpFjXxGklGbexlJ7/+bDJY4=; b=alep1I3vOjfaKaFm
	5MNv3K+zxXZUZR2mbZ2Ez74LNGCaxJ1y3Bk+oEEqeQ3OdJhp7Sah/uAgiuRqS1du
	D3Ryj9ceUHTZ2iNRRfM4yXPqqqIIYETEclBFVlExAEFSdQrHmkCKf2xQT8Cax7LV
	JLF2O+ecc8ZbazDx07n7U+DTdOUNslUoSJNjmHMYIsoea77OsRaCsrHHkH1u8T2Y
	7cfgsX3gW8LZ/sNZGAvEU1IMDy/bmLbGLFeUP2DYnNM8L8pISv4cBK/4k/R3sJYy
	JDy8f6F6rMLgLbO1w8jhJf1h+Kn1yAD6gvfsIxjclAWeYHO/X7vOgK+eWHdRLwp7
	baDLcg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap51n8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 10 Jul 2025 13:03:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0979c176eso24470985a.1
        for <phone-devel@vger.kernel.org>; Thu, 10 Jul 2025 06:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752152587; x=1752757387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hjPwmWtX19e7Bo1S75MfSpFjXxGklGbexlJ7/+bDJY4=;
        b=kbo+Lcxlab4d4D3IPsFnTA6zT/llVcU9HGyXPNHzxJrlE6VpyqHBA1J/T8hJ2cXXWS
         18ZsG7vf6EBlLezSfQ2CajNLNiC6WwnzydjQ5LcIkdpLoF9FxEzTm2j+7nwPaJMYkiW7
         pxB1iC9W9uF7CzCTsZrIxVnkL7fup7zOiLBSvKJ2K5stsDRdJkLBYkbGA0AeeabCyVGA
         EVdFtftVlOEMAgsDiifrKS/aLcUtmS2kQ5VoYZfIRc7v4XziwKiprDh/KqUemt24V1mq
         g3HFXayg+j/TOXMYi82Moa6hZJSS40FPFNUKSM92x2DfixqXlcjFqDXOe9v+jdNM/Hy6
         iwZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSBl8JFOy6bllDt5jEIec2WtTvDStsF+wc9glqOuwCDEsbEFeSUu1rY78a9vlLkHQWjTxml8hGUZaXYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaOwkKv87YgYJPt7O0o50D6+BSg9NEVYauPcrluHxwHyIMPMN1
	OqAqg7y2oU1zah5wiAspqMU9udsNOqh97GuquF3QUJgNSI4jr4sv304cK9wXa7po3h5fi7mJYzD
	se3qFFxpSzEdyjat2aj2sm9lgsG34ELv0FsYaCm0iO4wFcdhmQOgnxaLTuIJv2MWpHw==
X-Gm-Gg: ASbGncs/AHADA6PYQU+ArdDdEH6rE8pGwf9tCmYadrpNvyI3W4XsYt2V4t3sjv2NJxQ
	OivCTn0Uue6cEsGy8cWvl5gQodNqyiuCoymi5ahT1V50LyDKjABpKLOfg6Ei4WldszahXbbON5W
	xL/bFKc1dZSkyDj1MP584F5qrUnBBy2xLY0kEV7ILi/hCXXvoBKiv50PVTmLNzN75v5B5HjhLAG
	SQajbdKETLV17ibgdS0Ix7tmPmBbbQveSd/rJVD+duSJYqEIvj2n73rNxFu6Vq6+rEOQzdp4SwB
	gpElRINdolVEDScozWCUqTXLfjEhWPfzpNPf+JU52IqdE0SG1mwFzhsiHgo5271TVnUmu00Hc4C
	nPcc=
X-Received: by 2002:a05:620a:2810:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7db883e1940mr326979685a.6.1752152587569;
        Thu, 10 Jul 2025 06:03:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6exVhBWalN3mEVmzHEm6fjFFCRoIo9z9jPpENbHQBbPTFSkUeK870F8+4Pggl1oRlRowFkw==
X-Received: by 2002:a05:620a:2810:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7db883e1940mr326975885a.6.1752152586933;
        Thu, 10 Jul 2025 06:03:06 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e9105csm129701266b.20.2025.07.10.06.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 06:03:05 -0700 (PDT)
Message-ID: <c1a48230-c4f5-4c04-a53a-449bd90b1fd8@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 15:03:03 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] regulator: qcom-rpmh: add support for pm7550
 regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
 <20250625-pm7550-pmr735b-rpmh-regs-v1-4-cab8ef2e5c92@fairphone.com>
 <bc27209a-e0f8-40bf-979f-3d747c501ae8@oss.qualcomm.com>
 <23ae6ddb-682a-4c4a-bd63-f0a1adb6f4f8@oss.qualcomm.com>
 <DB7I7D3P01FF.3T5WRSTJIWLVK@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DB7I7D3P01FF.3T5WRSTJIWLVK@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=686fba0c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=zB4J7WEKRVuj73cAIgoA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: NkXKWDS-LkdvYWoiR-8UGJi0SvPAPA9v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDExMSBTYWx0ZWRfXxxc7iP8lDCum
 fj7gzg0zTdLj7IXrTjQz9zinwE2HP7lNqzyTlHdvdMS7917mLonmP75xhjeLK2YTGveLYVcnSiT
 FyX57+S1NkV2X8hH2AHXso3qhXn2+w2npxQ2mHAR+pkY6lyXpg3trUwEGSoh2CgrYYeKfMBAFVJ
 7NtK6HGA8JrU+Fnscw6lvcYegLWfsH1P+0ySZ5paw0SD9Iymx68vyC34OszGYvzyE8NFwlt/cW+
 s6fbXzxDrWU+WNSp7hZoHtBk2fnYP0yEZ53IPWfCTxHXT5S9sP0mpbtAH77Kiaoz5e6sU0t8Nan
 Ji7pKGoknF+gTSshalIzDmu6Nyj/TeC1zlSIQXc7PQxaBwc4OuLjonoHImi/KzkKwA/k7itJNo4
 3Y8x5B1qzmRiWzWfGiXeJIhiZBrSIceYw2H8xuN9ugTJRlPzP6ynIBoMh7+m2mwHKahNCL52
X-Proofpoint-GUID: NkXKWDS-LkdvYWoiR-8UGJi0SvPAPA9v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100111

On 7/9/25 1:56 PM, Luca Weiss wrote:
> On Wed Jun 25, 2025 at 4:20 PM CEST, Konrad Dybcio wrote:
>> On 6/25/25 4:10 PM, Konrad Dybcio wrote:
>>> On 6/25/25 11:18 AM, Luca Weiss wrote:
>>>> Add RPMH regulators exposed by Qualcomm Technologies, Inc. PM7550 PMIC.
>>>> It has 6 FTS525 (FT-SMPS) and 23 LDOs with 3 different types.
>>>> L1-L11 are LDO515 LV NMOS, L12-L13 are LDO515 MV PMOS, L14-L23 are
>>>> LDO512 MV PMOS.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>
>>> FWIW everything you said in the commit message is correct, but I'm not
>>> 100% sure how to map these LDO types to the existing definitions
>>
>> OK so found another page (also made sure that the supply maps are
>> indeed OK)
>>
>> SMPS is OK
>> L1-L11 is OK
>> L14-23 is OK
>>
>> L12/13 -> pmic5_pldo515_mv
> 
> Based on what are you saying that?
> 
> Based on 80-62408-1 Rev. AG for the LDO515, the Output voltage range for
> MV PMOS is "programmable range 1.504-3.544" which matches "pmic5_pldo".
> 
> But yes, in the table next to it, it's saying 1.8-3.3V, which matches
> "pmic5_pldo515_mv".
> 
> If you're sure, I can update it but the datasheet is a bit confusing.
> Let me know!

I was looking at the same datasheet as you and took into account both
the LDO type from e.g. Table 3-12 and the output ranges from Table 3-24

Konrad
