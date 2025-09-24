Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E862DE6EF
	for <phone-devel@vger.kernel.org>; Wed, 24 Sep 2025 10:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758709756; cv=none; b=omFMfbjKO2Q7WVGnD00Bv1ZquBg8Sr8KmI/XxttmYodLj8j6CtVvDIlX0O8Y8KLVDnH7+Gc5y3DAnjZXecmiZ6B3FTn1LwTi78hukuxskVhr/M3iu9Y9z0Kh/fg3vYfVEx9EofBSxXdNbtIXLuhlImFbeMO1DYkU+x8yqW0//BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758709756; c=relaxed/simple;
	bh=/9hL9612Gn0CJSgidmnFRkESRP8UBsfv5LMScs4CM38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vdw1g+vV5PJldJBqJBeI5uLAaLj3619JGOUgdt4Ge1T4/LpQi0jLBcZcKsN51EgDq1cyuCn9SjKacNybAC+pj6X6J5d4iK4CEG9EGBQMHkk76ukVY76dfhI+c4dSzaGlDC+lFg9X/8FgBMGGNHVSj8SPtb4m1flVBymBL6Wz1fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDs3QR4+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDs3QR4+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iL5K027919
	for <phone-devel@vger.kernel.org>; Wed, 24 Sep 2025 10:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zjk1j5ULWEzsfJ1pudMsCTDGZ9oTBcQfVxDwzmzjuXI=; b=lDs3QR4+DKETWGb+
	Qf5XIKiPb7zV6rCF4dM9vt4xj8iNGH7wINBX+P/09KvG1bm124czm9571qRlr9Ih
	ueZfE6/WbZE1ldWRvafRBpExP1cTZSwlIJHsH8F9g60JsTUZqQhj2B69EC2JDcho
	He1T5vH4dpfxZ2pxE6s9KJPjvpXkP6SGGCYuNs0oL6JEvouD9nNy9UK3jZsz+6zT
	d2HPJGI18CVTFAofx3b+5R3iRza3HGK90RGM7kbV7iqMQDNIm7O38mZo43pS3il4
	0ps2uaawxqUT/4uYIXlEp2carI+LTFCaZUXkOHCnL04PzQy652nzhYoi8eRUx8Jo
	0C8+Cw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnv9qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 24 Sep 2025 10:29:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-85345eb36easo45347785a.3
        for <phone-devel@vger.kernel.org>; Wed, 24 Sep 2025 03:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758709749; x=1759314549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zjk1j5ULWEzsfJ1pudMsCTDGZ9oTBcQfVxDwzmzjuXI=;
        b=S5Q+bX6oV7mxaMIxmSw8i/S/ytpdnMvxvxShuKSyf5WfCSlFR6JM+baXKAyDrxSTZ+
         vJA4YPV/XEPAoE/c1DxUEco9I35KhmPXC3BITG3xg3Wb6uEyNjd/p+4JqzyeVe55Me4u
         1X0BK5RPS5LGEirk61+0Zj4tUAHiN0CnAABZeyoPxSR2vaVI/IQk8usLhp7d75VGX9O7
         sJXkpvDx+X/B+52ah6IRmB6h/WnK9BDPMBB4JuQyTAw3tWP9wQSdlWY/VBBdgxpY8xRg
         kcS8KfFW80w1ZDgwowwQ3E9cFTLlMuDOZ4BdyAQ/MSQsfVQl1cBipL+YVcW4cfhzpWe7
         BHQA==
X-Forwarded-Encrypted: i=1; AJvYcCXcHAkiCrZlz+TzT8CO3LXKqPUjPdyCUVSB7EIZEwRV2hvFffmyfhxi01TT7CLf2gtSCbPHZJuBIlcjDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs4ysz/URmMdZ7H8Bb6cqm5rM4DWF2IbhlUF/av9M+SqPA71vh
	frOetsbWOL+YXrTTiu2a96+dVE+rDqZA9b1+NAXSb9HiSqrKDBMCApFbofG1pySbxXhCwmtzuCE
	9MXV8bzzmqTSAqlaYcn4zsf1N6VHdm+DCGe5AZaK6q4xZYSmG6/w/HplkkfUmSbW91g==
X-Gm-Gg: ASbGncsvx7iebevfh4Gl0oQhVpKqQax9IR3rsIM3IJ1Ubtv8f1aSjXQEKKvlJUMYPLY
	7J5nIWACokKxwawuP/1K/SNjwfamkZ7IGw+7782bePTj6ZwGUkbSXINPgW8b0RgGPaRssP6lNY4
	mik3cK454WoQ/NLLTlxRK5gznpqkrWdJOczyGiGc8j7Q2wMbOXQ2kw0s/i02KT4ILMPKIXvvF3Q
	olMMbj1ZQ5atqTsdhPHRA9Hrf2eBemcriObJfh9s61wBA1VprYiSR1RJWxGld3tmFj6fkdmfe17
	t6yJfX/fLVL39AHKxMLWJW/3ePN+FetYLq4hLu/RzI4dLgC49+OxIuVaZU4u+2RcJYdCTWGyGUZ
	bO1DJ5vg5HaV8NalOMtvlEQ==
X-Received: by 2002:a05:620a:9444:b0:851:b083:37e9 with SMTP id af79cd13be357-851b0833b27mr305214185a.7.1758709749066;
        Wed, 24 Sep 2025 03:29:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRzIWeKgyhxXr/t44Dh/z5B9dbWTC8JKuLuTfE3DKhzEiNCFnlBYfyCkI4J25I5SqB0lq0GQ==
X-Received: by 2002:a05:620a:9444:b0:851:b083:37e9 with SMTP id af79cd13be357-851b0833b27mr305212485a.7.1758709748562;
        Wed, 24 Sep 2025 03:29:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b290caba5a6sm935424766b.65.2025.09.24.03.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 03:29:08 -0700 (PDT)
Message-ID: <9edd7057-8330-4d1a-97c6-e9bf05dbb722@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 12:29:05 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: dispcc-sm6350: Add MDSS_CORE & MDSS_RSCC
 resets
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
 <20250919-sm6350-mdss-reset-v1-2-48dcac917c73@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250919-sm6350-mdss-reset-v1-2-48dcac917c73@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d3c7f6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: iDamd2TojG8mAxKbVXdIXoMFeRJkrLNq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX4Z/0fatu2wud
 N0pOEgR0hHDV5qhj2zXnV4xANTHbrKNBfQBQhTD8YBbi0LqFCLlIqghGbVwD0mHlhKP/fdRUMzE
 51q1EQM+UwCRUpxxt8ugqon6LMivaDy+qQGYtAjmG8Z3koPOxq+pVuaZc+osMcDAzH2dUrL+WED
 3va2OOQiunjfgkmuUaJ6mZtwRO+3gG8V9LM45mLkzvYlxhmdfK++g+ugovkQ4OP8Ry14LMKvkPP
 AGwt3nylObgHZELzbPJKVaYqZD9LhUzTxAy3D+1D1kb1Vl21ZtOqFHsn+b2H984znluLpv+5ZmL
 wr1W3fgOaWJPUWImDdyWwqKnvSQFH8qMorcZyGTfqnJLYkqvHui2a4SdIPSJ7on3LI+92K5aTAj
 BtvKMEKK
X-Proofpoint-GUID: iDamd2TojG8mAxKbVXdIXoMFeRJkrLNq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

On 9/19/25 11:57 AM, Luca Weiss wrote:
> Add the offsets for two resets inside the dispcc on SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
