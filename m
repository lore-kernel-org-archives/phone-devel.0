Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012B0217F55
	for <phone-devel@vger.kernel.org>; Mon, 14 Jul 2025 12:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752496342; cv=none; b=rkPZKChnHd+PUtISBaaNLGgHL6WxMJ4PKmLNv+Wcpd53Q5FiroX+WX5pA5Qn/lC5TPvqFxnSz8i5wAm5P5vvduL1gRxMx4WP5z3clsIaq6VGL6rbg3n2Me3wKysCWquQ1IOZJNkwW88PZ7IVFOJCOlfjRTYvdA45oqhmgu/P8LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752496342; c=relaxed/simple;
	bh=flFLNAWDk2urtyAkbTkLSFABCC4IEkAZoRUS6V2MQF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mq7eM2S1egkrY3r2J2LntaHosko00QrD1OOBU2AG+FvOi1Fj3GXj57GjQ7ELrNY6XdKwjex10B5eVwhHVd3o13hlW8N5QZn8eeOqtZN8VjZA3UTn9DJvUcfu/CMGDhdxsCGr+pIEojmRPbOOOodH+cPmL/mIdlx7ZhJYeTsOHVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ROHfuF0L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ROHfuF0L"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E9xlxq030713
	for <phone-devel@vger.kernel.org>; Mon, 14 Jul 2025 12:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7q2lysz52slfDvlR51XkXLPg
	9u1Mj3w8tjVs3VUtBXw=; b=ROHfuF0L2sw8STjmfZBWWQ047vDeEh3kZEyfIFJg
	JRluHY0SK41fUp23rFr6f8PrZ0MdFCyPVTSHaApr9ERSUQund++5gYloO8SVbOGI
	9dbAbWfwoVqhPJdJX6akFeMMir2dRIHIBVThzBR4yMgCLRJvkTOb4v6WGOXO/wcP
	7oEdMLlXwVqx2znScwvLXrULZPzIHF0Ka0qDjulLIMPyqOZA9q6ts2pfFWOzUIKD
	RQERtPerbQh2bA/Nu4ZMaQ+QpY+qTm8EzXrTK8p5Z7IMjUqiFoN6Ocryqf3Wm2vy
	HYQ671/j9a9ZLhzrUXmaZcaSVHiqeyNFkXgGeKrwl3Nm2g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37vr75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 14 Jul 2025 12:32:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5bb68b386so1297644685a.3
        for <phone-devel@vger.kernel.org>; Mon, 14 Jul 2025 05:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752496339; x=1753101139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7q2lysz52slfDvlR51XkXLPg9u1Mj3w8tjVs3VUtBXw=;
        b=RoOl1da3cP0j9ZoeKGql5rvc6xgbK1FHgE66e9JoN5MKO4QDG21PnPSQZ+bOR1rQGx
         1S2S0UsbeSLELjxfpZtsq/fOWsMelrv09ohT8WCekjX3SPv/kbWZmOJ/bOqUyQuKmuF1
         +Ji83QOzMWOLOddLQ7yXaVqOlctAyM5n+gX6eAZDePEt3z4MTR+OOlU3ZpzPVcm8cT1U
         2Vql/3OfsLlaRu3R98niNujx3FVcCOa0XqQZLaquZSl6feEqGyNLOAyMBsS2At+/JR/g
         JNuRSThXMMD6YIyjc3LpXq+roUJ4pJ/2msgBaLIHTmOrvuojZtIWCHteEAuFWkH3Mxd3
         tkMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvLF+BDNSNThl4t9tF7/8acOQYKXyVPsfPG5MtFeJM7RVC1HPy988mL+xhA5JB9zWDD7RyVH1LR/nAtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFl2DbQYlR5EGnvLK6RFWHLCWage/Hua7wTc0dCzpZiYlsB5Ah
	lHnewDyI+DPsB2DaKWb/bU/Y2NXODxdai6Z2aw0xImCF4iSq1ynImYUSy7dKe1IoaxosJJ84H2L
	MqYxV2vgVFIx2xLlUDUtsqcFBABbVvUX5w1+oW0GwcXkF3nLQ/HP+vv2ukS1fqgTDwg==
X-Gm-Gg: ASbGncu9UJ7J0sW0WjkrrXRa3zw8oqS+Qr/4U4DxXwpeQQ8BetjBkNcfd6aAY4yss8B
	1wvmsNZKRAgfcms0H8Vea7g+XCUbrHlvUIW8ShsfNOu0Ocyy7DSYtf+axIyLr82MHvE2qA9om3X
	01VctFkcS0DcGNTQNytp6hkH7zG5Ez/Rs3xPJ3cJsw25K+i7Z37lfQwm/6QTqC7dC9LVY9I/mVq
	WOxOQxAmN93oUzjLfg/bkWgGfpd5NcasMhtudtUNvQ9mPNeM9oAqDv/V+mA07QcMIePCXGp1e+o
	d6Vt7eA2tHbRilkSKaMSLdlj9TMxskStDsLEiMi9N8aue0++gozIX2EbRXXg3vf6m6kzrj0L6rJ
	dkGwhOT0UwhBgQUg67TEQFba7reM/oEqLnAvvZtm1Y2zP4B96MV7e
X-Received: by 2002:a05:620a:414f:b0:7e3:2f19:deb1 with SMTP id af79cd13be357-7e32f19e3c9mr222595585a.33.1752496338620;
        Mon, 14 Jul 2025 05:32:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJHWSGVbWAfapT1Efo8CREUZ3rbnR+lvZ30NNYQVSM3Nje58DWmrPudsFI7Ni6msJCAqNm6w==
X-Received: by 2002:a05:620a:414f:b0:7e3:2f19:deb1 with SMTP id af79cd13be357-7e32f19e3c9mr222590185a.33.1752496338111;
        Mon, 14 Jul 2025 05:32:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab916bebsm15512601fa.105.2025.07.14.05.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 05:32:17 -0700 (PDT)
Date: Mon, 14 Jul 2025 15:32:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>
Subject: Re: [PATCH v2 01/11] clk: qcom: common: Add support to register rcg
 dfs in qcom_cc_really_probe
Message-ID: <ovquneide5g4tpaqr5ptw7b3yr77u4hgzei6z6u7tieysbi62p@6vjbgzhjxd6u>
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-1-9e47a7c0d47f@fairphone.com>
 <64e27035-d124-470a-bc5b-66d254b6ff4f@quicinc.com>
 <DB7I1Q9TD02L.2A18QMRU7VXHD@fairphone.com>
 <b60d3297-8267-460f-9c4c-1519c511ac36@quicinc.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b60d3297-8267-460f-9c4c-1519c511ac36@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA3MyBTYWx0ZWRfXx1jrJ0Q55x8f
 QCTxUQEpyTHYYju6F6NPsNXL5BM5+ndQDv71AFQX1agacH8NaLQouutbqDx9PuVnz4fUK0+CFzy
 Hu1ik0OrDcqMJWliDZofHKJ1EncXxSDQE0vMyMl6feCCPUMLPU3sAwL/VVOi3XzMruVN6GgDk0x
 6I3Fl8iioWnqzeM94CdSfuCB0YkTCEtKl47/7S9cI40jBztozGD/NVyKDoenN9QjndGAj++oOuu
 BZ4iVFyiKoFgH2CtTh0cqABhX8C6O3Wgtu/YsiCU47PPDCi0s3beMpWKGU6qfU/BZ6up/Gy8wrw
 kDnfxalS7uTX5+qyPYFIGAjz+zCzY8Ushr0BOewG2QcNPbqIho5JiDB47rz45bCFxidweRuNNaO
 s78GEOTwNmXrV3IQiRoOZZrLCGiEsdwM3WgyDfz7BB6O0jcpa/30spXDLGPh7yFEEAiAAvLo
X-Proofpoint-GUID: Hk1GBXFGwf54b_CSmqTZFYh6NY6kYdu-
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6874f8d3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=tQVf4dIAefa0khsDELoA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: Hk1GBXFGwf54b_CSmqTZFYh6NY6kYdu-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140073

On Mon, Jul 14, 2025 at 04:34:39PM +0530, Jagadeesh Kona wrote:
> 
> 
> On 7/9/2025 5:18 PM, Luca Weiss wrote:
> > Hi Jagadeesh,
> > 
> > On Tue Jul 8, 2025 at 7:34 AM CEST, Jagadeesh Kona wrote:
> >>
> >>
> >> On 7/4/2025 12:46 PM, Luca Weiss wrote:
> >>> Add support to register the rcg dfs in qcom_cc_really_probe(). This
> >>> allows users to move the call from the probe function to static
> >>> properties.
> >>>
> >>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >>> ---
> >>>  drivers/clk/qcom/common.c | 8 ++++++++
> >>>  drivers/clk/qcom/common.h | 2 ++
> >>>  2 files changed, 10 insertions(+)

> >>> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
> >>> index 0f4b2d40c65cf94de694226f63ca30f4181d0ce5..dbe7ebe5b8710fb03c1671ac9022e608a6aad35f 100644
> >>> --- a/drivers/clk/qcom/common.h
> >>> +++ b/drivers/clk/qcom/common.h
> >>> @@ -43,6 +43,8 @@ struct qcom_cc_desc {
> >>>  	size_t num_gdscs;
> >>>  	struct clk_hw **clk_hws;
> >>>  	size_t num_clk_hws;
> >>> +	const struct clk_rcg_dfs_data *dfs_rcgs;
> >>> +	size_t num_dfs_rcgs;
> >>
> >> Since all other probe configurations are added in qcom_cc_driver_data struct, it is better to
> >> add rcg dfs data also to qcom_cc_driver_data struct instead of qcom_cc_desc.
> > 
> > Dmitry suggested to use struct qcom_cc_desc:
> > https://lore.kernel.org/linux-arm-msm/w4eujq72uqflqpsqshc7zhu6lkc7owufep2g2rjacvzgj44vmf@auonp4ugbgow/
> > 
> > I personally don't have a preference.
> > 
> 
> Hi Luca, 
> 
> As other probe configurations like critical clock cbcrs & pll configurations are part of driver_data, it is better
> to include this DFS data also in driver_data.
> 
> Dmitry, I hope it is fine to move the above DFS data to qcom_cc_driver_data struct instead of qcom_cc_desc.

Yes, of course.


-- 
With best wishes
Dmitry
