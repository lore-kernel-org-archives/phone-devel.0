Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8524C236A9F
	for <phone-devel@vger.kernel.org>; Fri,  4 Jul 2025 11:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629964; cv=none; b=jJ8N91TB9elADxMQ5Hw6JCjr2T6kGI+sTVflno/6UnXitI3rt0IGF9Q7XYim2RTyj0gV6ZEhFvm660izhfgb84n1qow91+TuCbg6JuE74E2/WkOtU41ZtQu7rd2tJdymedP4gUNTeuhOmelMg+5VDco6CN55HyV5py/XCVfkGXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629964; c=relaxed/simple;
	bh=Jxr0xdYuj2907vXx/1ixI7Q7uwKRLMkvjPjpU4giaJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h7yrTwUY93ej97TVm2btxf5Wr7155KNjILAThlOWcTc4qaO7psvsRz2I04oFxjWqBD0Hujv8E56vyGOhZ8O2vSm3IUDZu3xGYkjCAJNAWNWK6aLnk0NCqVLqofCw/lbvTpBJZ8Fqp1yJW9iudVZAIEvOBAmrd4wiAIw02ue4F4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SSIuxwf8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SSIuxwf8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5648fqAU025936
	for <phone-devel@vger.kernel.org>; Fri, 4 Jul 2025 11:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BsXV7drYMwvyEcS2Cgw5YwM718MexIAF6Q1pCCfKGWA=; b=SSIuxwf8cuP8xhT+
	l0vtAkYBHkf3n7wGfnXOBiaKJSpq4JUoyl0S4JDcFbQij/q7xoZO6NiLliDHOOkS
	sg/KeH6Nh12N0w2jLbfDPooI0DITSAGd1ozxtlVEkS3j3NSaHB/recD4Rqz7T4dN
	FZkgsE+nq3t4A+jp5X5kzVnFGjPDEtqscj6gan5pHJrBNIAt7fzcMo1KVRHdIrNe
	Z4uHJQHeyVjvH0u/PnDsnf4fLsxOBG+DEcoA8QXWnMEJ4i2cb5I20otkGodNyXIw
	m6cZKG33XiP6eMZzILpa2BgpsK+8wwYsOLIaJnfHd//1YtkCEBDyXExzaRsYhQ2+
	Wk182w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd650wef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 04 Jul 2025 11:52:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fafb22f5daso1631016d6.0
        for <phone-devel@vger.kernel.org>; Fri, 04 Jul 2025 04:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751629960; x=1752234760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BsXV7drYMwvyEcS2Cgw5YwM718MexIAF6Q1pCCfKGWA=;
        b=VFYXOZvNoyu5aPpznziVhsWJE12tg6Wi4IEAmHct569MngNDhvNjTIGTvVU3h0t2kd
         yBjz1wtKaYf8aczwMZen4JYLibJ1BqoY4mhPzuY5fJXByTQXlZcM8ZMMlIgMHdeYskM4
         0eEc6u1rVAZOMy0soqXMZBxVn3CnDxTNFef8wHS0e7f9ECtIZ3aekLKOFq1n3KvPNWAW
         +BfyW+aAEhMaQvyDPJJcULa+yJiJPIRPiVxpmSv/NBP0mNrq4JC/pYmJDkPgb03ketWU
         F9EpdDSR5ZlBgJ8LjIjPbr2NbYVirEqEYf+fm1lF6MrxeD3tmAmzGkHZF6QXSN0VUwdS
         4lvg==
X-Forwarded-Encrypted: i=1; AJvYcCU9+lKCbM6+4EhzAyGv3N57M5GEpB/ep/CAqYSRhu10va1M0f6tVtJBfkG2jkAjO1P09ZmismPzkFFxMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3E163P9URmA0xfUOrUP1tijILYRNoDoMa2ZijkiruhOV/TL9i
	HbemOJV2i7YRqZI5AhUIn3PFc+90DZrdkxQN029f5hF4n4clkmKSJSGZ0mtBWNkOMFSGuSYCCHc
	Qxntn5XWkz8dpFxmXEYhcbicJxQDVAFGH2UwDXJ5fK2z7Ph4Ub2vVAjHOjx0cM2BPQw==
X-Gm-Gg: ASbGncs2iVBgQyN3LmN9hTP7ajzQNrtxGT1gnmjQw6cO4JfJAmSOEQtYG0S0i2+30uw
	gxxraV+zkmk+W6sG2dZ+RbUg3Z4A61dESRetgrB4N+OFSuKyTSPdDlvfEX49+cVX/aH3qIGcsmV
	CtuQhDOUxJJ//MVV+Xy83zs7HsrfM5ZrhIBmHWC2vozn7T+EWhhFhGWvDFzHcswwI9Sran0rYSi
	tbk1GkYVs3qg5V0VHAXp8UX2zCjVSNzlN2a5D9JJMdcNUDGWNhSecsKZ5G5yiWHlQ97aqt2XGte
	TT46SSwIN4kpTOuiENAxUZB62F+UEgaYPjp5m9Gv1OKQ3gOg57yxQ7gHupdOM6b1EPpqtdieA2f
	mm2C8dQ==
X-Received: by 2002:a05:620a:278d:b0:7c3:c814:591d with SMTP id af79cd13be357-7d5ddb5ef03mr114076685a.1.1751629960628;
        Fri, 04 Jul 2025 04:52:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCSLKywpPAh98geWs3TsZPTeVlJ36KXynK/cQGjD+OqSD4iTSBmU5d4Bk30MBe3jGsdImkDg==
X-Received: by 2002:a05:620a:278d:b0:7c3:c814:591d with SMTP id af79cd13be357-7d5ddb5ef03mr114074685a.1.1751629960186;
        Fri, 04 Jul 2025 04:52:40 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b04d30sm158014266b.133.2025.07.04.04.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 04:52:39 -0700 (PDT)
Message-ID: <cfa9cd1a-2a5e-4191-b27f-172ba202175f@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 13:52:37 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] clk: qcom: Add Camera Clock controller (CAMCC)
 driver for Milos
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
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-5-9e47a7c0d47f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-sm7635-clocks-v2-5-9e47a7c0d47f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6867c089 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=lahI4EVxXURej6Z-Ve8A:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MCBTYWx0ZWRfX4ttL62H5qs60
 6l1H5nGVI+9h9qB7Ha8vC/pTh20C82Ymvs3mDUwTuEcQLEiycpkEy2A9WGw6/st0gZtZ19GBs/n
 0TPvhfjenUw4m68zvpq+f/QIzxlSrKwY2BfRg1d3Yj3bK/QQ4TMWJ4iV4+LBP4fMOvdHnyQVEYA
 58UWrl4N0Oa4sstIQ2F2S9U6QaI5l1c5KaOCQB4jfld/cvP6Ph4Wer+pOwRbwjScFtjNu4s2j4Y
 dVTQLKJC+4KIOcBxZflUijs5ojKMqhR4WtUh+zUYcmPX8QDp1OyBMLj7T5xF7zId/VlnzfHvfoQ
 CscRWyah2TIEaTAJkRRoUmt3xcJDmR+MfkLTgVm+xKProDAf9Bj0Col7KiKV4nsMjqtCl3MjPof
 YBIyF7QKQ+G7zc2Z38kWvY0n/8ac31BJbg8BdDbT9wjlDZAYPvQhlcM1a0YoWllRFcVuCYpB
X-Proofpoint-GUID: 6GnPvt1pVo9Ml6rWHt_bZQMPGt9XVOgx
X-Proofpoint-ORIG-GUID: 6GnPvt1pVo9Ml6rWHt_bZQMPGt9XVOgx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=931
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040090



On 04-Jul-25 09:16, Luca Weiss wrote:
> Add support for the camera clock controller found on Milos (e.g. SM7635)
> based devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
