Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE40B207669
	for <phone-devel@vger.kernel.org>; Sat, 28 Jun 2025 15:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751125775; cv=none; b=mIMx7EzM7janQMRnpxMYl/ECtku8Mv5pM/YBsvA28xM5AmQ8C1A4qAQtaITnNtzy0mjIw6HNV10IIuSbsZR5NjG1racWkUviXKY5r04/dh3UD2w5VZCckVJHQ2OYAyzX5yq/MNHyUfeRqpEMcHmnjgcbGG/3oap/Fx5mOloOZS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751125775; c=relaxed/simple;
	bh=WL6yGFxdYVn/A2aBxBxpKdgI+CtpIum5MIW6TKC+oDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6UpAzjtos/DofZsHOQcgo9tfsDR92D9xZOK+3RKX14ia8qnilIDtcgF0OP/fGXvVZ9jMzSjb/w8miHik0YmP7cnkF09SM6hnDst9rJ+p4HmqzH5T7KD7Pbt+RDgjtYta8W//91S+f6Py7cypgZ08n370lyxIVBJ6s5FZr+89YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZPdaOyUd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZPdaOyUd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SAlIgk007757
	for <phone-devel@vger.kernel.org>; Sat, 28 Jun 2025 15:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bFYlRX1M4QgR0o+DfBbhVTZP
	AQPHZI02U/IaC0TWvGY=; b=ZPdaOyUd2qIF8lQKby/XWSDokyByHPqdM0n0twUH
	XlhP4QTe2E4bT5GjNFLGrTTBBY7VB6OxnYiYlmdzsIifZFFRYNf+DwX29A2nMxcV
	Ema+j6ppDZmXOoOZX5GLUoDIHcJmwx5S7ccvraD2X+0dCc1J8m+VQCD4O8KyGN8w
	uYWB87tbdOnrcs9nr1X74HrIhAuFzMnsIpFgGC1kYkhHJVcjHFOhUAxBF6CCOEI/
	BfkvG2P7dgrXMKVIjkEvItiFBAeYy6mcl13kp2ret9L8EKvZgJ2Fk4N10Y7yJ72X
	/ZFiePikev+RfwL+5INtyRSCkc1IEbX8/Y3smBIuciVEpQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s98syr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 28 Jun 2025 15:49:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3e90c3a81so77501885a.1
        for <phone-devel@vger.kernel.org>; Sat, 28 Jun 2025 08:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751125771; x=1751730571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFYlRX1M4QgR0o+DfBbhVTZPAQPHZI02U/IaC0TWvGY=;
        b=H4/oCsZ0WQgNY7VpdUYxMIt4XCaGBO6x7jaBs8Atqu4tN3vf+lKgx6rGALjSIFeWjg
         yxTneQTDk0YHJPzCrgh35vMZuNIicQZJ8KN3q9R2aGhKWkkxjKBw/c+X6+FGDC8XXkfX
         SXj7LDCQ4O7uuCXQVx56O7puI4DymHZgApLmtT1cSG1yrzkrBge127WIOD0AYIehP/Di
         w3HXFujqS9T4M9ar+oXXkXFZ7ceArDoFtc/nbgrN8L0MRkd+aqyamc2DlnNcXhHuQqf5
         ODbM23RvzHUi20MQ+IG0H/xwZozhPS9sgwMgbd9HNj5qFQlEZZNur/u2LmqJRHsHbrKt
         xMCg==
X-Forwarded-Encrypted: i=1; AJvYcCVFtARAcqyrZYzlhZGtnIC779lrbXIyjdewdgmsd0amSSa0BuJrVnubSizr4/0x/npN8+u4l9EWZ/L9BA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE7vmqC9/dqFiLSF4Qejufuc1JDwmvU7HE/9geashu/M5mMbgU
	MMVIq33wnABxYB6htTaV/QJHDyI2Ztl3l7Dwjsl8KUn89tCKUOABVf0cvXSA3Mt0J2OeFzDaSlk
	6rCpaJQZd6bJhTimTu3c5znrNzld54Db0AjYroag6jVb0qsLpzlX+2n3SbxRSLJDKXA==
X-Gm-Gg: ASbGnctlOP/NAh5VXSsQzRUXvq7/R1nXPSUpCJO8nxUgANoSKbRCLx4NT30XLCOZRx/
	Z5/Ub8dcmmQGekWvGM4Gf0x9MHBnViGblxDszGhrDDqFbjd+uANwSqr6YgMs0pytX+JwMW4gkoK
	LlNjAcHCGmkzS0+no5ZN6xJmcTAEPv0Ok6/EMtIQ2Vz0xwMwR8TZyDscITUL8QoKWjNZcHY/36l
	pfGxXMvDAacW68n/EmBTD6QFJr2pfEfR05m1zu5rNeByc6rOJy2LSfWAqIjp2JxzPsClGG4HzMt
	Fei0RdDoADk4rrWdoR1ZAN0dq/IXlFfKsLrDm37Scx3tp2WQG97VS3XL0Lzb9uQUGU+XsOOaokr
	lasXFlCmIaDfaxlGTq3fWqRsq9vzE5MAK3/Y=
X-Received: by 2002:a05:620a:4403:b0:7d0:9ed4:d269 with SMTP id af79cd13be357-7d44397de4emr1022354185a.2.1751125770922;
        Sat, 28 Jun 2025 08:49:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTc1GHFIXHHTe6OywkmfcHC6MJabIV0A+xXqmDPIh6fhNsR5dR6VvXgAtiOkV5DRj7Dqn9VA==
X-Received: by 2002:a05:620a:4403:b0:7d0:9ed4:d269 with SMTP id af79cd13be357-7d44397de4emr1022351085a.2.1751125770470;
        Sat, 28 Jun 2025 08:49:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2dcbaasm838063e87.224.2025.06.28.08.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 08:49:28 -0700 (PDT)
Date: Sat, 28 Jun 2025 18:49:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/3] soc: qcom: socinfo: Add SoC IDs for SM7635 family
Message-ID: <woo5nauppiy2i4xe4ewbsapuk6ixdn2davyrlmugwcqagjgdke@akj2ehtetlmh>
References: <20250625-sm7635-socinfo-v1-0-be09d5c697b8@fairphone.com>
 <20250625-sm7635-socinfo-v1-2-be09d5c697b8@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-socinfo-v1-2-be09d5c697b8@fairphone.com>
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68600f0b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=CBhOcW6rsiGSrLAFeggA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: xtSTYbSnaX4MCYyKiM7X7CR_q60lCfYe
X-Proofpoint-GUID: xtSTYbSnaX4MCYyKiM7X7CR_q60lCfYe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDEzMiBTYWx0ZWRfX15afucw2Lylc
 8MSlZsx2U2reFEfm6YyFo6bZti2xaVtLhd0a4sxUoWwXrn75GfGKjPuA5uZSywRH8P6V0dDGpWu
 8sIc52tMcXL34VpJHTeHJTUqMAWQB0et0MMfDfJC4TFZ1Y4O+HVrVM8xWJ3cOCCLNINTBQCtAQ6
 SyuEWOGjVEvAZmgZLutH2glx2Ue8wyfCiCbMcQNDzAyA32VndUqqmWTTDgW8WdkPSWw+53EaXpa
 ebhfzKOeFDJXUTvcdDn7zkAAglH/6DJk1Gg9iFcZYT/Ma3zS1/rSEtu4HAYZ+Q2JyIdZT9QBrt7
 3H7pmjZFzZfgBDzfMCgAIMR41V9/M7qfJkmxUyLd5FzQ6M0E2J7C2NFoxzmoDOKjCV8qsmdeaaH
 h5+LNzUKBKmN/l6A13t5YdK0gaVRWJ6rQ5375bhgFxthyvx+4DZUitB3vYuBrKUILQetZuO+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=967
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280132

On Wed, Jun 25, 2025 at 11:11:45AM +0200, Luca Weiss wrote:
> Add the entries for the 'volcano' family, namely SM7635, SM6650,
> SM6650P, QCM6690 and QCS6690.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/soc/qcom/socinfo.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
