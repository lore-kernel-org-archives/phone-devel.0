Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DDE35F5F5
	for <phone-devel@vger.kernel.org>; Mon,  2 Mar 2026 11:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449464; cv=none; b=flNGwBDDKxPGhz9wrvadoIPTELLErVD0ks1t+gBu0fMkmJ9l/HCH/NwMOOG31NjX1sEXI3WbzlK9FsOqCRgHlVVEjdacZ8ozvp4s6nXF0bsYmp1fVH4bGTC9wsDKvm3atf40wAOf3dORhELo7T4eCLy7IzV7UHBH4yYb8spYPFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449464; c=relaxed/simple;
	bh=K41JvuaQyeRwS6GPlQl4faLZBPG8q5JF8fXy9k4Pj68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QPLDltQMbGx9huBf8bg02qYGoc+ZjFfLfKNI4beeJuEBN4rRvL9wM2dPspvirsBbg/XzgS31vSn9c52dcvCgf/3mPFDeWnlhNaucLTpUGZDPUy/NfDsbZOf0KFM7yEU2HxPewu+XrHoTo4NEM+2lEqmilx3g3fwgloye3hqfw9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZ1dpez4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GyYHOcRm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZ1dpez4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GyYHOcRm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62285bug662340
	for <phone-devel@vger.kernel.org>; Mon, 2 Mar 2026 11:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lCCmOAnoUh8IxLmdzuNREYdTDnLuWtjaX8sTzp297YE=; b=QZ1dpez4bJDficoR
	RhQ9Sb/0BsBhf+KyrowiYM+XlrAOe2p/WLjMTACPYW71uXsW40RAYZZB1MR9l699
	mXIkuW8bfNzsD8h4gp6cCs+ncFNcv4WBJ2hwhhw2zyzQKIEWGYPqsQPzXeDCQuF8
	HOl7r4ZtYbWH2Wv5Lkghjsf8jULz7jGNdYzRxnCsMfsk3uxQ0pN8ZezxOwnxo9H7
	jq0lgHH54EB2K+6YnKHFODRpiyb5cCmpI5Z2Sxe9W/PlC5BEPS984sQY+yjmq5OK
	KG+UdUyVsSm1D8/trBuXUnih4vxfdvgNh1f26Rh1q740PjEhg8I7fThUYiM+f6cX
	97pAkQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn6r2rq5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 02 Mar 2026 11:04:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70cb31bcdso415838485a.1
        for <phone-devel@vger.kernel.org>; Mon, 02 Mar 2026 03:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772449461; x=1773054261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lCCmOAnoUh8IxLmdzuNREYdTDnLuWtjaX8sTzp297YE=;
        b=GyYHOcRm+PTdxU4Y5Q3kYXugc7ghiZ7ajHh4rtr/wykvqdNWsoJcfNy1kdUL4CmFq2
         yfPDuHvsziY1a32hZvhcjDZWhsXN6jX93mkpGzsF+HLvQ/33ysIJsqGMBwKXume5Iqe/
         M/T9kD2PyzsfcAN11JCHCW2KEdcH4V7+FD8Zux7l8pCu5IAEK2WVsjM4bJ7OgBxP+Ag8
         PzqKW+c5Wlhs64rlRgxZThrNFoCXi9RepXBZUQ4rOx+ByXkWteYh/6jh7BgA1hGz1BgN
         KMCImcUsHrAAZNUlsmYL5iCJNZpXNFq+q9MCqTwgvGm64rqYv9jJrR+M39smVstD9snz
         GqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449461; x=1773054261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCCmOAnoUh8IxLmdzuNREYdTDnLuWtjaX8sTzp297YE=;
        b=cX+YpPkS7AwTQ6Atgzp6+NRU/1sAc7XCVBHOyzUZgHhTfhjDouA6CQU4wTdF/c+w5r
         VUjKscTyOSKysPubEvxrOWtwT38Er6zirp0xhuoyVX6A9+cOGUS/DnkuM+fnYLnOghUU
         Voy5XRHGatyosWkbgp11KuefeDoGWFxLnq4gsnf6By7JMCpQ7pNnmb69iwrG7URfa8p4
         IU0m3U2lZBNGH8VLzIFAJcRGqqQjP60cBYjkQRohwtZFMvDFlpR9h6X1naLoe3xuwyGu
         TqcBrgFQJ0WP0ODJTSrJzshQKd108A83w8R+vtKc+rWrWKQ3OE6BUdh5cnN/ugK8LcrT
         GemQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE0IiyJBB5np/IUF17I6qv+IzCPVZDdm3LDHrmvCgiJHWNEaGZU92wq9/MXgcX1BKAB6Yoh0UXDjR21Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0/FHBPVu/3F2FoJv56xUOGRKSzTfF0cuEhA5TVWHHXMI/HdtV
	eRB7oFY5Z2gRcIGAKfempZsGZR8GO4bbOJpVEdXelx26hD2X2kjLgzkk+l+kjP1wKFVJ8Bh38bf
	xQP2II4G8tMwmMufdz9JPK6bWpV9h8Sjgj9N7teyq96p4m0PgCNEGRa95rH2v3TbrZw==
X-Gm-Gg: ATEYQzyOOec0JHd8wST/ZnVPdsZGZjezsO7WDg+ReAyMzBcFB9OSKjTqB0kv2M3PbjR
	6G7Defuc0HJn2oELKCzwQhqG4ctrIKoaFApyKJu5CWxwbo7awg/uyLkz4tnWoVXWC0UygJXawz8
	tzKLXC7g/kYvXqNXTn2klU/wYDFei9TecwkdpULAvrDp0/XNKYjnuwEbWPCTF8yAYXd4ZDx+jUU
	ZLh/yHTAF6JbuX/cFvGMvo1IWfj2L7UhsW7JYUwRMu7pjC3PcifYVMQQeaefXXCc7sZCMuaIcQI
	JgSxLf/P8zaHzoZ30NHReQxJgWwVH/GzWMvwK5pN92y/grfvOv86lIYTJadztPl6k3qbdpZ0n0R
	mUhfTHNd3XlR54023/XfF07L6ETR4aQRUWE6iVnr2MYNp6yeqbirhV5NpIOWOnMJ5xgoe1Ch/wq
	kDMNU=
X-Received: by 2002:a05:620a:4155:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cbc8f2348bmr1176613585a.7.1772449461143;
        Mon, 02 Mar 2026 03:04:21 -0800 (PST)
X-Received: by 2002:a05:620a:4155:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cbc8f2348bmr1176608885a.7.1772449460723;
        Mon, 02 Mar 2026 03:04:20 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9385836a84sm318934466b.59.2026.03.02.03.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 03:04:20 -0800 (PST)
Message-ID: <5d3694c6-57e7-4943-8dbb-41334086e8ec@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 12:04:17 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] Input: stmfts - add optional reset GPIO support
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-7-22c458b9ac68@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260301-stmfts5-v1-7-22c458b9ac68@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YdcCQ3Bj1Zr_n1rZLQnwQ_g6IZPK5Ydk
X-Proofpoint-ORIG-GUID: YdcCQ3Bj1Zr_n1rZLQnwQ_g6IZPK5Ydk
X-Authority-Analysis: v=2.4 cv=Hpp72kTS c=1 sm=1 tr=0 ts=69a56eb6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=sfOm8-O8AAAA:8 a=bmle8qjEDyfOUcEunfUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5MSBTYWx0ZWRfX4qATYXiFmOy7
 49ld1NNJXJpDPJ4Edb4XFRbAkmOHK/Lct10kbfvamyC0a6lqvIC+TuS9VHkVNZF64ELo+/d7J7Q
 YDhgRS3hvDgVJbHa6IVj9RYmp3WCOjxmzaK+TIxzgTX+JyHxiscv47GNvEy2gi3kGHP7pVJEONa
 P9YrEfEzELqeg+07O5zUMVUUORGGqQQmhITwjdpSsQp+P84kwDTmKCN8QIePv6FyyRs8XGJayTf
 RGAWxoERdd1CE386DbSOCotpxeZ5HEvhi8fs22PdCnKN9bkNBzmP4eSh36ZxGlvLwYpaSr+06xM
 7K11D7jVvyU4pOM3/Tb55Sf+5EBDM4qDA0CdCv/VOw5NMmDmLX7gW2Fmv+Dru02nvCoFweXEIlG
 PxeIJkAIxa4mL2bDeheleJGqvNxcLTV+E2K0yNggu7gUjS6z60hZHCvrKeGvxlKq9z/L5+eCxql
 RDI5WcSHs8LS+aBYbnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020091

On 3/1/26 6:51 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add support for an optional "reset-gpios" property. If present, the
> driver drives the reset line high at probe time and releases it during
> power-on, after the regulators have been enabled.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> +	sdata->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						    GPIOD_OUT_HIGH);

Are you really sure the reset is active-high?

Konrad
