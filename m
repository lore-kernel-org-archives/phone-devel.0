Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB74A485CE7
	for <phone-devel@vger.kernel.org>; Mon,  7 Sep 2026 10:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778694; cv=none; b=RUzCbIf7aO5W+L/DrX7zi/RCpNCcJ/NjWdnYoBlrIDo6SOEz9tNKzBbxaYN1UUb/OJa3z6prtW1Qf1BwmTm2z+0hgLvKbHbq6sw7kF1xqU+jWs1JE8g87h62v3R+2yG+I3+D3Ae+dDJlNts1lU4/gDhzoP29YcRvWqWX3El4Kvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778694; c=relaxed/simple;
	bh=226zFTrt61gC5bUJe6htzJbBh6DTMpofqMeezkvIwVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTrhvbDnyumcN5NWhUcOWK7LzkvY0z+z6La9aVUQvq5nrNYoycb9gO0WJiE3MBr2PehPIUb3XvGApuTHDhUf4qJuVSUdE2kbbpNPmRUOw2RIfcZjuYAUCjuW6GZ3npCkZWthDIvef4/1ixpZqU8bHVeIU2Cfm+y6kRIPrLkWUJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkvbUMDt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GprQ5nRQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkvbUMDt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GprQ5nRQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnO173777603
	for <phone-devel@vger.kernel.org>; Mon, 7 Sep 2026 10:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rlgWTU4l5TU2Z3+onQ2BGvvK
	P4C66DgncaDRweKJZts=; b=dkvbUMDt9tIZsDKDnW/qumgRf0QCoKn5DITnjLmh
	09vpx1rYA6zQJtZew/7pgFSenXB/eCXeg6CNmQBsaURlD0X549nMthQPOWaVkRwR
	clG0iVrhlcekgF2caXDAI3A1nipprDRsu9UaMTkpOHTVWN/r/4suIF+E/OjxFHw8
	QZCH4vfnAUlU3aW9rcVs81J/P/FLmquBkGRldolZ4VJg6IVOq2BAaobr7FG975zG
	i5zajboEKOrLseTmU42I6pXdkQHGPQcPcBPYm1V5Qa6/1aFvSN4AZc+4wJIVU2Zy
	v1dvJzE/XKGO0aWY7t7Lq5yHKO4SksM6X9N7N5gkdBkWSw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfygqww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 07 Sep 2026 10:58:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e8135d7eeso58350986d6.1
        for <phone-devel@vger.kernel.org>; Mon, 07 Sep 2026 03:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778691; x=1789383491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rlgWTU4l5TU2Z3+onQ2BGvvKP4C66DgncaDRweKJZts=;
        b=GprQ5nRQWl0kq61gpkpZiRJFz7cbahjbRSnDS9VCKXD3mRKZM8Z2a0ADsRqgVuPnbl
         Bne3Shr4MLO0Hl1XtLYaUTkMPnfh/UPHq/msL4LPrZWtDNGCS+86teb6JHguyBJJBQQ7
         FNr32RTiRZImgvqTu49Q13GbH7GyKANJMzMSio84xZSArwmAfxEo2zMKtF8ttruRWqMJ
         ei738JA6YOXHuxoKRnN0MHfBZbr74MjPe+l6dAWBJM7SHNYLwx13X5w45TD1MlXD6GFM
         7wWqyYGESGOOJWoxZniv3b8n8P4nr6Hfn5pEfaknL92bMmT+u034kgBD3jQ6WxTXsabN
         nX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778691; x=1789383491;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlgWTU4l5TU2Z3+onQ2BGvvKP4C66DgncaDRweKJZts=;
        b=JQV0CAWHbOTe2B105Nw33nsbaPnldWhtutmM24v5trT0qTSuaeWBgJvhCpYnu1bJYX
         2C4JUy+ApOJoYzcpVGM/N3Zzte34hkgh9EdoEseKSl1gv5l1bgacr4UGdXssVv3yoFJe
         Wn/M71Qx8Kxb66cLYEhWZpyHa02n+ATwMYGRWqfAaC7GKnlP8X8IR8SdKLsJf5j9PQ0W
         zxT5kuHVz3/dNOk1WNn4rHKjtXjixXaU+67YjYMzKbcP3yc4k8RQ/IcY/v0CaMz4ECPC
         2QTHUKWJIrSpQCAVERJnGwbrnaix3v6W/GjIQrWRhNIFPkw8NKxDFgDQx6T2hwTaPKKn
         1JNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAZ1jUZNBOxZFdRBXMpvJdbQNogGrmoZMDe0nuRnbWxELFG6isDFzcK7rU099iNENf/Nxd4Jd3pkDMcw==@vger.kernel.org
X-Gm-Message-State: AFuF++mdm0wa5E/oD3wHKga93cv91jAk94j+5zniXUjKPKkZ7BHz07eN
	6Wyw++Fzj3ikx/rKM2QFcW+uwKORTMVz4QOiNOSTt4Z0wHOdX53SWa3sj511hhI+8c1Vk41xxZF
	n8SDvOcE6u/poFLeZ/LMZ5V+ZeSEp6x9+mf/iGtoq4RcXgRiLhcXWZZ3raoc4UHpHLg==
X-Gm-Gg: AYBFou3VLj+uYCYbuN9gR2U2yGKhwivr3NZ23Oo+oK7zuWnHtBz/b1N/yqwMZlnkNJU
	zPjUPiLT3ohNVymy1t1itSM13rsBK9+bAto+ey+q6vt8U/IIzs14mZxiQILSpuByssoAUo8ECS0
	u10v67ldIl7h7mRqDy5iLLchR5hAGR2Nf6T9PigOzSniiOqyo0FbcSihaoCffcg+punhIUyWYC0
	uRZ3zb6GVniZ2kFAFBjgBML/aat2nKlxC6/b8X62uv1iD9vTIujhD95LZ2pbSuCWpc7tUT5VR7O
	qOiycUC0idkNqrn/pOLL8I/v0y3br2hpZnkxYq+fXkOEBH/0Xn6Z2zb2BwXCmjN8apCXBI/01jF
	FZVGS/cMydUgu2A==
X-Received: by 2002:a05:620a:a495:b0:936:883d:89c6 with SMTP id af79cd13be357-9398043579bmr1824665585a.28.1788778690568;
        Mon, 07 Sep 2026 03:58:10 -0700 (PDT)
X-Received: by 2002:a05:620a:a495:b0:936:883d:89c6 with SMTP id af79cd13be357-9398043579bmr1824659485a.28.1788778689899;
        Mon, 07 Sep 2026 03:58:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d0656e7bbsm200216825e9.10.2026.09.07.03.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:58:08 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:58:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v7 4/4] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
Message-ID: <bif2vhuzfskrniqvp4acoxfjvpyypr533ulwpvo3f7pwkcods3@wa47jbyowcpr>
References: <20260907-stmfts5-v7-0-4a53381cd038@ixit.cz>
 <20260907-stmfts5-v7-4-4a53381cd038@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-stmfts5-v7-4-4a53381cd038@ixit.cz>
X-Proofpoint-ORIG-GUID: Hl4cGD-bgqUyLhB-CyUYa-g9t85X44Ma
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyMCBTYWx0ZWRfX6YejRQx2dmxy
 CxupsDnG1xH/VNafl5W4bEn0O99h21ba7ppqJtxZzZz30D0IVas6o1Kr8RHbUkwd1rXeiEGyXeD
 rZSx4vD1Hx9RbGmRJsdHXwKC13qOk4QkiLXrza8Cbiyo4GWuodzsoGNg6QaINpSGZxt5pNzrGda
 nJRh/yQDWOnCcnO6itYMM1V7BGDMvdwTouDE4k6ds6BgPpDVQK/gD58YaAtqH8KuLP7mlDLdRe/
 0VXktJyff5QdqnWzwhws90EN/q8YFqb3UP7ZWLyfWryLGfiuksm7dUx6ujifwkE6lYE3fL5C+MM
 Oc7+Vd+mCDXVNIoTX7sMOUg5pvy2jMFw0VV85VGa+C64CpiyV69GOlHGB/eKmUAOJklIQSmypiW
 F7vmIEmaMQ2lR03KLzigEMxw/Bg3E1Htwj2GEU/Nx2l/Ch3NvgfsrB1U2aOeDc72zauViaVS3h8
 yzwywpSP/BFiOT/uFDg==
X-Proofpoint-GUID: Hl4cGD-bgqUyLhB-CyUYa-g9t85X44Ma
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyMCBTYWx0ZWRfX9o8BCg/YaE51
 XxwcRwN5OYaxZzhONZ3ZQvVLSvW/TIkP50hujufB9lsJmGvmnxBtTF0YKyky/4IEjBzITxb4y8m
 rFvvMffF1qgA+sq6tpRSk7i/g1Jh0tM=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9e98c3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=edXKPL0xb2b_iQIxsCMA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070120

On 26-09-07 12:50:22, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Basic touchscreen connected to second i2c bus.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
