Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CE22E975A
	for <phone-devel@vger.kernel.org>; Tue,  9 Dec 2025 23:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765321922; cv=none; b=Od2lpLGdZWlj5ZRw8MSFiid8jK4M9l796shC2yex5KngTavDDYXXeySilHxn2BhABlLcVml5Fr1+s3UEW/RDy8k+IBeUmN58LIUnIsUrvp6NoAr0eFYjSn3eGrBLfJfVEr6DsOcvbHveQUmJx4NzbGJqi8WVATT8GLWDp5jt0RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765321922; c=relaxed/simple;
	bh=8ChSwUHdw1a4imlf5mlmeQxUhLaTIcEsabis5huZ3Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adCKc61u9wV0gn/UJ+TFBejzo6gqXSK5daA9MWknNdBUDpuABClDzuKg/RtXO5LbpwzuFLxU8g96FNAHpWgJb7DFnf96DcJ3FB2U1WRDYjApKUdoJBV6ApZCeQKVbprTDWbUb6JiqF0VXe+txDJfQMgfKOhoqlhXE8e3sNo1h9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dUENsZ+U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MGhCxfEU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dUENsZ+U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MGhCxfEU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9NBOVp150422
	for <phone-devel@vger.kernel.org>; Tue, 9 Dec 2025 23:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yMHuwAiVf8kefegJzUtXsfVv
	UTlRrVd+3Q+FhBxOBH8=; b=dUENsZ+UJ48u0p/1msQT9rVhIGKb02OnAijmb37H
	/ZpB1cnL5zggBKtBa7/meWrX33miPP+WWGJk60bw0UFDJYPy29YSGkLmX/eJqkun
	mS+PK1YRkPvMzt9egwq1QkEd3ALLagiO9ETrScucsswd/IHxk3RUXJeRRVZaYBJy
	82EY15Ts9OqngLL4tNPrv1lsxfuBKom67rJmvYV5oBKivSaLME11mZigwwONCSK5
	uYDed95ji7W51UClrZv6HMKE3JU4xfXK9Hk/kVNo0YSggX4m6XeAuWOfjtuof+QW
	PNNDrBurWLgIHc4d3NOZX9CLP+hisuz9FRN3n/cM4lDCyw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axesf2ya0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 09 Dec 2025 23:11:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b6a9c80038so375865585a.2
        for <phone-devel@vger.kernel.org>; Tue, 09 Dec 2025 15:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765321919; x=1765926719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yMHuwAiVf8kefegJzUtXsfVvUTlRrVd+3Q+FhBxOBH8=;
        b=MGhCxfEUMwDpBeD6VQ34DxqN+ZBB7IG+/EXpPl5nwJkP1OdhgGLC+2GxRmUNw2aG9e
         mq4WWbl7G70u3g6DdbGGaKBpDqqUgD886cvZEwI8/axsgSMA9O/I9f4NpkMsqHbELCgv
         ct8y5MEIy4QlpLCcBzkiF6NR0e3yyJ8JUAx9szTFxcRc1ZN58H24+THupO3lxSO5bWBA
         6v5CF3M9Wmt0TcEPIRIWa9eVImRnjP5B6wnnEOSWNkBfFDrJ4md411X64Yby9LWq3lfY
         OPtVJsVCa24zEtSu4p/zSkSVoK/IOnOvhq9Zbt10cLu6B42pbEZPquokv5BxEaF41cZS
         HEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765321919; x=1765926719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMHuwAiVf8kefegJzUtXsfVvUTlRrVd+3Q+FhBxOBH8=;
        b=ETja3G0xATV/sI/qTy0pkD5Ww5fSHee79ftzbhZeyMS6G0dymbC9NTzCvWqo4lskaH
         sVy4qx4UYWMpb0DWateifTQGBqt/hwEvMqsyvtgnt5A6J6XEPNRNccXWZ1Ir/rkZdrM6
         9DipdjAE3sR4emBLrAKXwewwRxvv7/rv02tjB+ebMf/pAHGA3s7JI7zxkpB7aMMQSDVZ
         Qbwy1eTOlA4B5PHBlsSXT6lOb9Vle2wU6Ej1C6l85ISh5Dw6RSTtf6V+FxQLsBU9WltL
         H0zyisYPrY+cNfXKIJ2OudZa9DNAk5eeq07MwCOkZAOQ1whk3ztrGBdwU+jV6KeIxify
         bYAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1ipfsU4RcWRk+AHW6DvtzzmObBECGBjKsN7LmXHljlFWScARoPUftZl8ejI4Nifpg0ImJ0j63iT5I9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyymcU1z/XOE9VWcxgC7Kt/HuH69hWFYn6iH4qRbXhtAjycEukH
	0QHw+YOaWrqPhI6wLy0U3RmSC1lMLpIFbSpXmQBoRGBXgFG334r3QaxLgyKbvLVa7r9pfcEvDaj
	LtAY/nZaC0dFrswhUfsB+QdkuGkqNkS+jh7NHH6mQkm9miXqOlE3TRr/jblf8qlaQGQ==
X-Gm-Gg: ASbGncvZyNwkYkUD629OAJZfvubIo0RySo4H5NwsJa0Y0Cz9EABf96qzRM7vFtqFIyl
	bIN6SGIGwXu1ji2ZDS/F4SaFnUZkYh9O6C1oc7Y4wlHQHnXTdthWKITnYJvNoZrnwRftvT6BeBj
	4/ToZpe8G/vCimvuNc3sujGH2I3sx5dYqRtm5ZXyYQwqVSrG0sMnwgjTIHUAXOc2EXj2lujtA14
	5AA5a82PKFTdYgZHY7b/C3MRn6hSnMxRcUMBPPmUc6MXXUpHG9ePyb5+sanrlaOvF1yfglVxS56
	qa+1OQBZH29TfudLODepg9/vYY1y3auL4ImoZObtTcEYjCkvYEZziM9/vz6vebnk1914z+yJFxC
	hBFMSTTBL4+YLInib0eebTbkJFtpzrAEe9TRkT7+v6T4xIlQniiobI/V/3W0zFT+IGf1GuV5pr0
	uf9Bi83Mh+fPPGWHHO0d0YFAI=
X-Received: by 2002:ac8:7d48:0:b0:4e8:a850:e7db with SMTP id d75a77b69052e-4f1b1acb520mr6471771cf.71.1765321918992;
        Tue, 09 Dec 2025 15:11:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGu6YCKe2+d8qDTizG/xo9axO+MFsZsv4tpX7vZUCsXjf711fNSYPHhgGJP5Gi0hx5bGJ9bNw==
X-Received: by 2002:ac8:7d48:0:b0:4e8:a850:e7db with SMTP id d75a77b69052e-4f1b1acb520mr6471451cf.71.1765321918535;
        Tue, 09 Dec 2025 15:11:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b24725sm5549491e87.22.2025.12.09.15.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 15:11:56 -0800 (PST)
Date: Wed, 10 Dec 2025 01:11:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sam Day <me@samcday.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: qcom: sdm845-oneplus-enchilada: Sort nodes
 alphabetically
Message-ID: <zdewy6qqwm2v4sy2r7mh46y25pifbnvqqtm7ej3aqjxj4cxnia@njdfyta2qna2>
References: <20251206-sdm845-oneplus-fb-v1-0-19b666b27d6e@ixit.cz>
 <20251206-sdm845-oneplus-fb-v1-1-19b666b27d6e@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251206-sdm845-oneplus-fb-v1-1-19b666b27d6e@ixit.cz>
X-Proofpoint-ORIG-GUID: nGvbRyWQ2dG8wjGWLFhUZVIOlAVR8T_B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDE4MiBTYWx0ZWRfX/AQ0X4Hux37B
 r6GZyIYNlNpLd6d7Yt7PtPVbpIqTZf6uTrXWzC7D9lCmaaTKuVTLB0XTJzMROS4OmdTtsyP2Z26
 2bJKmMxm4AyjCP7br5u4ke8516i02Pu+SVHHz6XoMXhgyp5VXkbQi3HzT6BoCvONLOO3iOyiSF7
 rvdJoj4MraQxAam81+LH1EIt/9ooQIOkHYzgOYUp1BFb22vZssCcgpjdy5bpJDa2SUehyz0w2Y1
 e2+HAYgCB6t+DHqNdrZPVTCdBATg/Ymo2oAGaSg2d0ZLJp4UO4EfVRBD+mqzjw4Rq8oToyYoqOg
 6R0sOOwgE5wy3PqSBA72DND8UGV1UiP86w+SAQsxFcfcS32baRZNreBkRdBRYLxqeGIkSjVJLYe
 /XZDv3p3LAZGfuPcC3TFZRAvDczXrA==
X-Authority-Analysis: v=2.4 cv=fMc0HJae c=1 sm=1 tr=0 ts=6938acc0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=1YaDnOEcMAd5D--0PjgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: nGvbRyWQ2dG8wjGWLFhUZVIOlAVR8T_B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090182

On Sat, Dec 06, 2025 at 06:45:42PM +0100, David Heidelberg wrote:
> Sort the nodes by alphabet, no functional changes.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
