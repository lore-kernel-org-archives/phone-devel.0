Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3404C2FD660
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 22:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769637840; cv=none; b=DZGL/d3dTsP6lh4irC8jzGW5HuVCu5EgBvHvMiUNWIvgDq5dx/w4bm9Jb1oV5/Z6QrrUV2403QqB76K3gHXlqJGjV+E7Q9la2LkGCRhHQTXciU9Rr0T3Gt0ukPljH068QiN1OhiXiKWyHizIWFI7jp0/RzknqAY0DmYT+hNndAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769637840; c=relaxed/simple;
	bh=twwKUsKsbKQgiOk3755aKnscYBOVlzeUsvaZyLlzzBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HgAKU/28JUO3gN+1FmZ62TOkEVzbdZbdC64O1EceH0uE411WKSy/a7na6Tay3jQ8p1YGYBVQupDDsdd5/292FtVads+mxxNJzTSZgwl06pKwvMWcGepzlTP92/2mDiIs9VFDYAqYxF5yubYerhAp6RjWiw+OOOuye6ZfWeNZcNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lS0Q7uoX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6nWVnbQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lS0Q7uoX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6nWVnbQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SIJeGh3906116
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 22:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qX2P7KKnIhqxHBBjw5BbK2GY
	A40Er84ZfsumUhnyNv0=; b=lS0Q7uoXFDWDqruxJ1G3emk6UEugRUrrJ05xJjm5
	uKFMkhGo9iz5NIyFY/BlLCwxYk/aMT5O9g6uVOFzhY12FfcZmQI8Wq/IYpjZplVk
	sR8CJqI/lqx5LOSfKe8d2N8gPK9pDmhEfNFUoq7Z6b16oCHamLPTHnN7d9zVb2hI
	a/WaSd/4NrBXJo+o5UXXxJ3+FhK+avYhoiSrsncl2teIZtgc8BiMUj/00o+KYHj5
	lcPriNf4vqmfibBWAs6gYhi+SCSamfgco30yOkx6wzWGcbGCdT5/j9PEsQA2zL9q
	SvBULDP3N1tFdsI2kKjvfh3UnSzEv8vBSpwPUM8hf3IebQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byjxhsvby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 22:03:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71156fe09so91931585a.0
        for <phone-devel@vger.kernel.org>; Wed, 28 Jan 2026 14:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769637837; x=1770242637; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qX2P7KKnIhqxHBBjw5BbK2GYA40Er84ZfsumUhnyNv0=;
        b=C6nWVnbQi1pVlYSMbjp25z7VFMtVSSvfw1x77YNzAXHDIf1EsSqaAbf85DcqVuJO7p
         w4mx6MkwFUnRbA4nknbXW3WFTRqKPt3B+bORdDQO2VAj9lnwPZktTlYOvOf98Ndow+w5
         Ugm+Hj3p1l5a3V7qtYqicyLmge/vpljreO9scbg9XvFx4gjhXWLRUpVT6VuRMJO16nzZ
         7DhZJuLmrC31W+eXL9HVUzyy4fXBHyF2HeJBuW/M3D0ZAOditFB3eszNV9aArdS5v0aT
         gHr9Mchgetls6K9XX/FEc0RB+M/CvgGpUSB6eOTXY2/6Y1hKpEqH1qs/7ao9LpKJLmXK
         7nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769637837; x=1770242637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qX2P7KKnIhqxHBBjw5BbK2GYA40Er84ZfsumUhnyNv0=;
        b=fjTgYNpVs+lol40Nekf7BIjAVnlHl+8eGYNPmSu8I9cV8DuoRUpbCCwTGvLTiepLyF
         BLZ59fnZTX6Zz1SjRG9Z7LQ9pg6DtQ33l9er9EICzjR/M9utA359lSSdw2PhD6yQ7Ros
         dnCZwrRI58xuIN4CfwyiRxjlH+/SFcKKTEBi0xp/fq7Q+UtTl/6CNptHmXk0raL4efPQ
         M7N35eMHTq7/3HT64TSpavzu/9PFNTQzR7itZDedVNaip15daZ31jGT/FFeyDVJfMgpM
         I9ZRK2yBAIGl8qe9l7C9nOz0jk0SvkwCSpGOm3Jqhp7IE94LU2afNZUAdnr3XtCY9xVG
         uWRA==
X-Forwarded-Encrypted: i=1; AJvYcCWgOFK+doW3JW2NaTqBGIA90VFv0CbtTNwpT4e/ErO0NR48wDKAnoWBaeVC+1kptbZtl9h8mzCpvPJ9Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq/JvJlOj/59tH9a7Uqp5aRx2EBp8jw1/SHB87+NZmqexTNgRv
	KfeM8/kO1rXkjvGtEy1++bHKqzQLB3HWJRvsmEvABujtKMIuPAkripWixF+IKIOSr9dJyKJcxHh
	D6kRxLspnE6NCGTR0dhk2TwyT+prMZgWxwtjdJlpUxSpIT5p0zV2ZdHjoPHkzhvNNuA==
X-Gm-Gg: AZuq6aKoXWccaYMqKs54l2GVjtCgZsKaC0aZiyKYI/DujqC/20mrFsn+m+3srd/sPa+
	d/N8ypaMcXMgaMc+M6xUp2NJKuwS/WaxPKCqZW49tm1KZzpbDq4YDxiEhnmXV2w4Uy8SalTZ3Qi
	mDYFLhpwTdHOPntNDDFP5AJXkGfnsWdqsJgCyh1NBF0bOP8iBW+edte/HT+fpszQhizeeFTshtt
	Nn4SsJxTaTf3aLSMGPFWtPHlsGCUv5sysnErEzmmWLm0af5q5c/l3aNyhroX6lThPiaL+1IvytJ
	nMMh9AexLcCAaT6v7fnoYD0x3/wB9hcT7dqppdp+lkvcn3MB3XE6pkUvk10ojCVy1Sd4wZaEHUu
	jqN0KiQussCk+kwu0H2DKJ2fhhhvz7w3r3Ec0BA5MBS5kOeQxZG3mTCQbtCMFoz7aGDAIs0jLmW
	Idioyvya74qe3uD3LB1aWKTOA=
X-Received: by 2002:a05:620a:1710:b0:8b9:fa6f:7e8d with SMTP id af79cd13be357-8c70b9268a5mr850660385a.84.1769637837501;
        Wed, 28 Jan 2026 14:03:57 -0800 (PST)
X-Received: by 2002:a05:620a:1710:b0:8b9:fa6f:7e8d with SMTP id af79cd13be357-8c70b9268a5mr850654985a.84.1769637836865;
        Wed, 28 Jan 2026 14:03:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c8e417sm5783591fa.21.2026.01.28.14.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 14:03:55 -0800 (PST)
Date: Thu, 29 Jan 2026 00:03:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] pinctrl: qcom: Add SM6350 LPASS LPI TLMM
Message-ID: <x42kgt6442p4gbbmokkqpmfnrr7kt27p244dasbzc5whi7jai5@2q4fn6hu45sw>
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-3-36583f2a2a2a@fairphone.com>
 <5fcbfcef-5fb4-4d95-b75a-1c425d1c4183@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fcbfcef-5fb4-4d95-b75a-1c425d1c4183@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: kzUSFB1iLvA8yPfHnTwHjY1duTuFaWrm
X-Proofpoint-GUID: kzUSFB1iLvA8yPfHnTwHjY1duTuFaWrm
X-Authority-Analysis: v=2.4 cv=b9G/I9Gx c=1 sm=1 tr=0 ts=697a87ce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=c8c3ORjyqegn7QojdrIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDE4MiBTYWx0ZWRfX4dTnwrOTWE6n
 /Ok17534gyOWB6+9OrQqRsw8vO5yDg7ZXbY0Uc9glFotdBpHOiFL6I9LnfNoabNUVqR9ynTabXZ
 20NWV/KpSDQDg3P3LoIE+JHeFAgJpwUAlN2KIJh9MfA1+lZclMvRtD6vfS08UPPCxLW2OeFy2cw
 gGPD28YE5FXfvXPwPPywFqSlVHNFhchhmlL4BCou1GcyfXps2ksU5wFSBJseAxodwd0kpa0eIzo
 0/FHwqaQ4b3KE2CWLxfzq896JFdwZgxpJGBmUARI22pIw3OzbVjcHiFTTeSuDgMaxqZ6wXQ/2AY
 mPs+r0pN+rUBcYBacZQJ2XvZZ74qNP6g8mNUtmMQZMhUzj43x+CuhgNDeG8bPKyg5xCbBuw79kP
 3R8BYu9VBR/tXL1GIpjvIG/9Hg95q4LFGr/W3snXMY7VVowXyfTTzlm4vG9j/rhgPKjNgr/yxEC
 wKO7s2rl9aF9FFJOOSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280182

On Wed, Jan 28, 2026 at 01:39:21PM +0100, Konrad Dybcio wrote:
> On 1/28/26 1:26 PM, Luca Weiss wrote:
> > Add support for the pin controller block on SM6350 Low Power Island.
> > 
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> 
> [...]
> 
> > +static const struct lpi_pingroup sm6350_groups[] = {
> > +	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
> > +	LPI_PINGROUP(1, 2, swr_tx_data, qua_mi2s_ws, _, _),
> > +	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
> > +	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
> > +	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
> > +	LPI_PINGROUP(5, 12, swr_rx_data, _, qua_mi2s_data, _),
> > +	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
> > +	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
> > +	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
> > +	LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, _, _),
> > +	LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
> > +	LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
> > +	LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s2_data, _, _),
> > +	LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s2_data, _, _),
> > +	LPI_PINGROUP_SLEW_SPARE_1(14, 0, swr_tx_data, _, _, _),
> 
> Modulo this odd cookie, it's identical to 8250.. but then it messes with
> all the definitions, so it makes sense to keep it separate

Might be worth to keep it in the same driver...

Anyway,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> I verified all the functions and slew offsets
> 
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
With best wishes
Dmitry
