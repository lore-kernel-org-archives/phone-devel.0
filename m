Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E23223322
	for <phone-devel@vger.kernel.org>; Thu, 26 Jun 2025 23:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750981078; cv=none; b=Wd+Lp8E6gtJlqhZt1BhvkwSqeL9JcU+tevbqgtRJcStkMevwRw7mHxoyCp0FyxeNeMWsO22pDfgASXYd+C5w4hsiW/A5lSrADpWjo85hWeB4DNkHGuOxaP/KltkKTY9qzYs5wcBE0985JpN9mcg41Vs05y1rEr5qrl9uSOOuuxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750981078; c=relaxed/simple;
	bh=EGpeMWLKnG9VFthSqSlUF2fQOm9eZpsV2Fv3d8hs0zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7TwYlZuseMDAALyBvNTCOCuAa+Vyx8/HnJJL1bO/mzA1ccK3zcF/7ZVeFEjz7KGet9yS8K7gjn8UbexUWgPNpl4GGshOGEiFQT4Tvd5ZU2t2e11kgmPwiAqr716AWleCnOkxZZflZj7x4I8vn34esNzZKLjpUl3HzPFKG8FcIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHmDmM5p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHmDmM5p"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJm1kM008400
	for <phone-devel@vger.kernel.org>; Thu, 26 Jun 2025 23:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oNGoQxfq9BmzRNrHBiOpebN0
	WGqD2gPosHFTzl27EH8=; b=NHmDmM5pPEOobkbBiDC814/nRYzrdpLvgK7ea2eq
	FYpbxy1e1ZpO4SHYQ3XyaUP6nCMkstPED78kVJv7N3ZFR1on5T2xOnTuKyheFU2R
	bGqMF+aj/qW5GiBLHPUVObEZB66DGEQFiFSrU4JRIkE9jDo93dS42NW0U3y5g92w
	cvTXUhCODMsPWAXBzGo0FSdfNTvwsPKDc2lICs5YIwMUmxlLSjaME32E4iLbuqJW
	tqgRotBh99dZXW+Aodukbat+q63nzO+QxXmQoFc0aZlRGvohXhBbo4nR/rfjzZpP
	KaTtyIq88R3q2QTId8UIOCNLX4uX+a8SwS/k06Wx33cOBA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqu9q7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 26 Jun 2025 23:37:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d399070cecso254068685a.3
        for <phone-devel@vger.kernel.org>; Thu, 26 Jun 2025 16:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750981075; x=1751585875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNGoQxfq9BmzRNrHBiOpebN0WGqD2gPosHFTzl27EH8=;
        b=kAhBLxbTvfQewUpof27bw3Ee36D3Qn6pJM8TVIH/0eU4GX03fO6z6mzULxA1qMYF7C
         4Su1MV/1vtes/SUVzcE2iyyk4tNYyJNPQklyU6x6Hx5hwUKYMWNsdovLqAim5uC4c41s
         CILY/HAc4mnyB+TMZMS/VvWiV2EwvrNLRBQ0Ao3yvZMBKKH//aCzIvI9wouIMu+QOxUL
         F08/lhPhgxx6RjM5eVx969EiUe8MGWM+E4R0JmJpTZ1vTOkCDvLU6S2WZjFJllgF8XH+
         FuJojbjjiXqLqsXEfkboHIE3qn6lwEnu4gURqSHlDuyUEwK3In6GEgJ/uGc/wSgZEmRx
         9PZg==
X-Forwarded-Encrypted: i=1; AJvYcCWPdU4ZYpWlat3ov06bDvrWjltLD0HkrwFftOQKXfOtuqfuZeodCW7bRtkh7lrKk0xpmKIaBywZJ0R1Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8p3BVyTgUMdMjpRmskTztImaaR+o+LaFclepezo+lCb0plTZt
	yd0oSrplUgjj3+lgEQi6LQQ4h6ZwRR+b6mE0Ro9hPO2unp1MEqObKnPo6Lmfj0HwWMnIsBVmwFy
	Wo3CA7c6DVJr13oe+Er4dzYdxH72HGXvPOxgUtSG4F0D+8H0BhHrgoIgejEpfihAt7g==
X-Gm-Gg: ASbGncuunTt3Z5amAW2Y2QbDSUQGdsKFfWPl7KfUD/E3rwsVPnwPgU+3bB8J19bJmKJ
	ofWHO5jtcVTAHaJWMBJXRZB/kgKjgaf54MlfoDkAQ9w1aDe3Py53Z/i+Mbo2YiUkrpeC6xV5IVi
	1oQeeRzxiVKNH2EGpFhCgobSleduTk9BUHLJaABMGM3u1+g08g/SdTcAa/vhy76SxOf8IqEVwT5
	Fie9DE3XB0+KrD7ZSB+5Yzx0E9DEADL4fceTbNKKTfzp43SUcOBpcaXm2OxCw+PHQAyH4hmlnU0
	QOFaC/j/2KOCwa6vQw2OGMo+yzM+XE3g7vwghZKdfPJ+j0OFRz64s5jntJFfJv/l1suKSG51Pse
	gWImuwBTl/vM8mKsXx0TzUH5/zxuVcrd0dyo=
X-Received: by 2002:a05:620a:1b9c:b0:7d3:f0a3:d91d with SMTP id af79cd13be357-7d443988248mr214252685a.52.1750981074925;
        Thu, 26 Jun 2025 16:37:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtdY9OETvGBAKYL+WWZHvWwuSqbMuPgwVoPJD7Cdt12Xn2UPw8ZnPr9A16Kk7BI7zL9BsGfg==
X-Received: by 2002:a05:620a:1b9c:b0:7d3:f0a3:d91d with SMTP id af79cd13be357-7d443988248mr214249485a.52.1750981074540;
        Thu, 26 Jun 2025 16:37:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2403edsm201771e87.14.2025.06.26.16.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:37:53 -0700 (PDT)
Date: Fri, 27 Jun 2025 02:37:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: qcom: pas: Add SM7635 remoteproc support
Message-ID: <id45mfkotz7g5xyuoumlx7oqkprwfue34bmh3plefurvmznq5m@275kadhyh4ry>
References: <20250625-sm7635-remoteprocs-v1-0-730d6b5171ee@fairphone.com>
 <20250625-sm7635-remoteprocs-v1-3-730d6b5171ee@fairphone.com>
 <3dd39700-4fa7-44e6-8893-b46c601d772c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dd39700-4fa7-44e6-8893-b46c601d772c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4ka-yJA5TX5T-q1-ylWXXks7rRYJ6e1K
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685dd9d3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=-dTNQW8ulQ0M454dHoYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 4ka-yJA5TX5T-q1-ylWXXks7rRYJ6e1K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwMyBTYWx0ZWRfX61A5HqRnp0Hm
 jb+RyJI9/DKdjs0af+OF3v/PXzNQ0IC762Eeeyj95OJTv9EnOMSIdUk05OROwhYDRzpedK8//lL
 fQR26vAzYcUwGVBeTkNtFPjXEG87EYKkpAwwz6ervqw/42F64pRIYx9GE2SwwUzV5lFZqhkTfmB
 OYFrlBD9eRZM/G2Y2SzgMU07qnA+1OY4XiVhYZA8G2LXV10jtkaLljtQkuqwqPGBzw3W8h2TKIx
 OMZqhJ/MTVmXi3aUi4TLXFc52KSVzEU/mrTU2v3crBKEOHm/8RTeRLK93jml5GgriiRQgV3LeEP
 e908MXSNs3VTifj4uiiDbEZyI/fyz/rSpVffo9uYXxPuXuM7CXNkkBve61T1g3YIrO06fFTqd/R
 AAvtWWGhP3H023Lt0cMX37rAVxTdlYcEy/iYAwdI+oldcdQDz88EbDtE0ofKs063PmNKXadv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260203

On Thu, Jun 26, 2025 at 09:20:28PM +0200, Konrad Dybcio wrote:
> On 6/25/25 11:15 AM, Luca Weiss wrote:
> > Add the different remoteprocs found on SM7635: ADSP, CDSP, MPSS and
> > WPSS.
> > 
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index b306f223127c452f8f2d85aa0fc98db2d684feae..6aae61dea8d0dbb9cf3ce84b9dbebb77b5aa1d52 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -1261,6 +1261,26 @@ static const struct adsp_data sdx55_mpss_resource = {
> >  	.ssctl_id = 0x22,
> >  };
> >  
> > +static const struct adsp_data sm7635_cdsp_resource = {
> > +	.crash_reason_smem = 601,
> > +	.firmware_name = "cdsp.mdt",
> > +	.dtb_firmware_name = "cdsp_dtb.mdt",
> 
> I wonder why we're not putting MBNs in here..

These should be .mbn, yes

-- 
With best wishes
Dmitry
