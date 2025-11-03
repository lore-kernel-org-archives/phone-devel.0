Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B53630B52E
	for <phone-devel@vger.kernel.org>; Mon,  3 Nov 2025 12:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762172631; cv=none; b=fN/6499VhCOtHKAEEo+OllXR9NyMxdd9O//QsxvnM4Lz6nXPf3x1Eq9iG/cH8wGvMXhTb2mRcnqy6hFAWTE6qH5bP6qQDcouXNtqZ6ds2dYcSgQCf8ZbHdN4mt/uSPY5aVfPpc2eiBOfdi8RVeo+E6fS9ZJM03+mdBYr8sa6XgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762172631; c=relaxed/simple;
	bh=GL67y7dtpFN+c7EYfHg2LIS5mPBVg3wakU2g90qprTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lhUtXotycJxBfya7vP+bJLJVmd/wpIe/Ql7yxRYsgyzED8ONWHoyqZ6s08xZcLf9kpgvMs4UT3s6ao8yQn9Nsoz2yiedNaidTjyEitQXgfn2YMpRLJRtHXFek0lFbDNNkQm/9fbXyMuNh2bRf5+2rpb0/FsIrurhRdYYdXB3Klg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RwVvNEzs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gD3rXCQp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RwVvNEzs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gD3rXCQp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A38vxP41644781
	for <phone-devel@vger.kernel.org>; Mon, 3 Nov 2025 12:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLDocl8OIbPcP+9ub1WxgqdY32ZSLXkBpKRcN7PVu78=; b=RwVvNEzssueT+rXy
	gr0p6nyCoKHoUo7l2WxXOJE5SoNfTzbHjm9SbjptxGZH9CXGXFKyWQBXvinacwnA
	fUvl0XhE17esXfaZsQ5wjP5P+VMjCE38SR6c+Ei0XuVqjHV8cknEArX9g7qxVLak
	nEqnbgaR3/Cx9WZBUf42I5ikzdksvgNhFNDeW62gFr0yKu7nCTphE6hK82YMPgRN
	SFa9m/GCb7W608WFlnxARpVlMn9xdRxJiJC+Nm5zu1Qlefnb4fr+MjIMPHtLvbPu
	loUaXyiUFQFq684GCMYYyAFn/SpwlNqd6/M6WQdNEtcfn61N5Ixv3I6rIVH9bZm3
	TdDKVA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5ak8mkb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 03 Nov 2025 12:23:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8801e695903so7107016d6.1
        for <phone-devel@vger.kernel.org>; Mon, 03 Nov 2025 04:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762172627; x=1762777427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pLDocl8OIbPcP+9ub1WxgqdY32ZSLXkBpKRcN7PVu78=;
        b=gD3rXCQpdmsfZmVaDyydJyoJHwm0FOMUC51iUTOJNzoUQhWea5QoJj6fwZ34UsoIxk
         8VjXnL6UXMFUNYRYDjW4+AVCQ/iyEB6PrLAmmCzeINrzVE1FqwcN2jCGv0TC6rb2SB2L
         5wCIMIKOerihgk6zZ/hJXfvrEfyOwv860dlLCcxyhJrSoUh2e06N5T26JsOlxDScQ19k
         spSilok/2ta12SkgFU0UXKJF1wWCR/0reM13o2Gz0VqzX0bwIskzmmWLhQSzJ/WeO1PU
         DdkfBe+jqgisW64jSSShqKd/tlKkCszab0KpyYyVptb19AEjidj0FaB2Mdk6ZbBfF6kM
         CGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762172627; x=1762777427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pLDocl8OIbPcP+9ub1WxgqdY32ZSLXkBpKRcN7PVu78=;
        b=CEyczGZV3mUEGB/ITl326QVUzfnkJL8A1ID2+FXsB2AV8hglTO1eUyxil32QfMAnqI
         Prlr1TvsuzOPGtlwT5gHxGsnGCpx3PxRbsLX68EU3lXgvgyELYGDQeeERV9agBQ5noY+
         soPU9AVDQks19+5OYSjd98k7y6MhmoK4j6+dwPefyu3xkxnF1YuFL3n2vLYDBZolNgCT
         TXPP5c6p24QBPRcJi1+tgonj1j9uTFzEo9tQFT0HjW4K/dH6PdtLaDJSzQaClKDXoVNH
         NryOJb/zirbe1Cy+lQbdo0OWUiOXjzlmtkwBIN9LXGGBSlqU2mWjx2zgd85qvKOeWOm4
         5Xew==
X-Forwarded-Encrypted: i=1; AJvYcCVY8xY4y9mL550v7U2OCj8/q9OklMjl7toad4/DsGIX8hjnVILCYhSjQAF4igezmPSytAb3n9vVxfis9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiV7HXOHI7wm1iFv8tiKe5gjc015g2Jd0mg48HW9bfcURMDG93
	en+MCazOSsEXjacE/nd58eVGrhlijrfV7bn19WKPot/lbPekJp9aZMUsvGhhA5bWSpJWoXSQkXl
	xZlOY0y2DvQ5+bo+9S/4f7ln6Tf7L94Kwv8lHVOqzxYT7h5m55PeMdi//n6pBQxWqmA==
X-Gm-Gg: ASbGnctwceHbPZY0VnGDAve3POyYfkW6pMeXivMRmJuGKEtNMg9XwUYrDs+2La/tPDm
	JOR7MtHuRYe4musVu9ZmKtiYTfBYumYlwd9gYQesPT4dzxj7gnZgiW2BHQgED++Zc0Hq8saplDb
	TRgKxe25ePS7x11uuJDv0PNogVIoIy2J3ACjtn3Ipjxv1hxGc84I70LwzxAcBMFOAGUa3JPby8z
	Ro8GHSV1HDwrVPnBWniUH98cW/rdykXVLHS+ZQctnONKdxzhrA9JF3pIqWEyciD7JNOW4/uonOb
	xaI/4N7Qcy8lOyp8faiqsQPa3MYCUygg58WEPKO205/gPxQMKags+YRaalk/+nxm3EwpE3Drfx+
	KF2Qr3N8dx3z32RyV6UiOwSXG21SV7bf2nJTo1Kq2XzReWTwcWghahyrp
X-Received: by 2002:a05:6214:c86:b0:87c:2360:d41f with SMTP id 6a1803df08f44-8802f493160mr98182186d6.3.1762172627392;
        Mon, 03 Nov 2025 04:23:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHNEHFu5uzZ0tS3YbeG5ybPjbh0d4UBxSalGY+3hESR5a39mHj9S8jaxD5JqLSDjkMxCzcSQ==
X-Received: by 2002:a05:6214:c86:b0:87c:2360:d41f with SMTP id 6a1803df08f44-8802f493160mr98181806d6.3.1762172626865;
        Mon, 03 Nov 2025 04:23:46 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6409012a6a2sm7946707a12.23.2025.11.03.04.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 04:23:46 -0800 (PST)
Message-ID: <0fd020e4-636a-4bb3-9c22-7a5b16e4d3c3@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 13:23:43 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Various dt-bindings for Milos and The Fairphone
 (Gen. 6) addition
To: Luca Weiss <luca.weiss@fairphone.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
References: <20250905-sm7635-fp6-initial-v3-0-0117c2eff1b7@fairphone.com>
 <c93afd94-9d94-42fb-a312-df6e26bb2bc8@oss.qualcomm.com>
 <DDZ1X799V2KV.269J9YL1AGCIF@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DDZ1X799V2KV.269J9YL1AGCIF@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 27SsDxrEYQdNqjpknGiCUWIB1rzYB_DC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDExMiBTYWx0ZWRfX14DIO1xQWjgr
 xEX4p0yYQV/ImeKiTE/wWIyQUvp1DFILx/1HGCBCbDXHvulQkOZ4E+RI1zZ+Yl2u4j/PnvN/rew
 gat+c7U4Rj0hAUMFrdw9uL1ZtQ+X3RXq8XMHEXOHtreN4zwt3dg4zRGTOF3Jp7HupEnLui9SYXj
 8RH7pjRqu140OYCVS1V638bBzGs4GAlW5qB4iXjYq6I23O/5c3xWetUJfM8Bwg5sgp8JmK25/V0
 uE+kgdDIcA5vcrfZSk09J3b/3mTnafht3daARD9CXmXzpOLn17SQ5wgunqFJUm0W7CiEiG1F2WI
 BqqdB0Wmg4U1+5KgQfAAgAc5kpnyXW0oA5ZfBgHeFKyDUk94JAXa1TeRd7Z+/7LB+2lk39esljv
 QUB2dhoi6rRGZVaNXI97HD4lG8lzgw==
X-Authority-Analysis: v=2.4 cv=ZZEQ98VA c=1 sm=1 tr=0 ts=69089ed4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=ySytLBbe-S1-HUGBodAA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: 27SsDxrEYQdNqjpknGiCUWIB1rzYB_DC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030112

On 11/3/25 1:17 PM, Luca Weiss wrote:
> On Mon Nov 3, 2025 at 1:14 PM CET, Konrad Dybcio wrote:
>> On 9/5/25 12:40 PM, Luca Weiss wrote:
>>> Document various bits of the Milos SoC in the dt-bindings, which don't
>>> really need any other changes.
>>>
>>> Then we can add the dtsi for the Milos SoC and finally add a dts for
>>> the newly announced The Fairphone (Gen. 6) smartphone.
>>>
>>> Dependencies:
>>> * The dt-bindings should not have any dependencies on any other patches.
>>> * The qcom dts bits depend on most other Milos patchsets I have sent in
>>>   conjuction with this one. The exact ones are specified in the b4 deps.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>
>> FWIW this looks good.. where are we with regards to the dependencies?
>>
>> Are we waiting for anything else than the PMIV0104 (as part of glymur/
>> kaanapali)?
> 
> Hi,
> 
> From my side, I'm not aware of any patches that have any unresolved
> comments, so I'm essentially just waiting for the correct maintainers to
> pick up the variety of dt-bindings patches in this series, and the
> PMIV0104 and PM7550 series.
> 
> Any advice to make this actually proceed would be appreciated since most
> have been waiting for quite a while.

Apparently I misremembered, kaanapali actually uses PMH0101 and PMH0110
and PMH0104, whereas glymur uses pmh0101, pmcx0102, pmh0110 and pmh0104

(it is not easy indeed)

so it looks like PMIV0104 only showed up with your series.. and I'm not
opposed to it, let me leave some review tags there, and I suppose I'll
just ask you to rebase this series on next & make sure the bindings
checker is happy

Konrad
