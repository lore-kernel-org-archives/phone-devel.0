Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBA9136337
	for <phone-devel@vger.kernel.org>; Fri, 23 May 2025 12:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748004571; cv=none; b=d6UK2Xfp0/ZFjEwhRMSOlZbvWqvkis/NYbC8xd+olMT3eRt83aFlfw8Dj1qjJ8qq4qu77Nq4C0EEfy3RejeAcdGVETNJbh3veDoUvInQHqfLFmcNfKzFmwiT/cTdp3UJWfXX/fZzxL3N9U72XvnWsVwA4E8kAh7VN6rQZlIk/8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748004571; c=relaxed/simple;
	bh=kgFxOOp1Kvo22UysdNlp5gMubOZ8ViIW1KGQp4hqvrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ovCamHNrm0N2jBgQQxIQY5CCds3Az7vcSaL83xdmi6zXCiFbgDWvBFXsXrFZyVxUzPVLw76D4UD279nZ97b/GKT/6MOW7EqPBWZQRHNNd2Zw5tHV16pcown1Jw33Xm0a803KYH+y+Uayp84UJk34pSng2DtxAbAYBBqtrmym920=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+kiSQET; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+kiSQET"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NBscjK016644
	for <phone-devel@vger.kernel.org>; Fri, 23 May 2025 12:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kgFxOOp1Kvo22UysdNlp5gMubOZ8ViIW1KGQp4hqvrM=; b=k+kiSQETgwbIszXQ
	P2yUuAEOPMW3pX6aNqjRdMmSkaEAgD9p/AKj3CcpuMgpoYKJTCJCq1+yZ7axe+wG
	I4hCyEv5INYqcMFk/iOTunNDFH+kvNEU8qe1v202nO89BssvvuLtHonzOrtaup94
	j9lV01CZUTzTr5GJYjP2C0+5bnHYgcZRsOrKGsgj2bFcSJ7iDgYo89VNorIoRSiO
	V2rZgV2pPxCftZrp2o9AmJHEX4bipk2xIGfrjqUpFfUIiS7303okXLGxya4PQb1D
	sDBUREeBhFMwVzY8yLBWBZbu6DxFvRt6Rkh2Sq3hJYIChPqPU+hT54YxCGEH4hUH
	psSrkw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfa23sb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 23 May 2025 12:49:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4768656f608so173061881cf.1
        for <phone-devel@vger.kernel.org>; Fri, 23 May 2025 05:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748004567; x=1748609367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgFxOOp1Kvo22UysdNlp5gMubOZ8ViIW1KGQp4hqvrM=;
        b=s28SoKO4RwrGgsRLU8LDdXJAjFGy4QGfnBxUTmZw8uAOOH9D6OpNCpAJ+BQDLYf4zW
         UeyOl5N+7/LbQcXQ5A5eaTSDBVDQ7Rs8F7hJIcD0X179Zyc3ypumeWNuM6V3QmbB6TPR
         BOsdJEckizpnZhpNBloVZYfTtLkQRAQNgU1i8yBIrHaiWvZcTue1Q7x3q1e0OlWZaptb
         zt+Lo4NPPOnL864VdcLZDidUcppwhcoksgvdwrLhButwxrgtMDnitZ6NHgWQyNNX3YBI
         nYo+fc7vcJTzk29SwoxvcNfhymiGKg39bJIrdSoo1YoWzahpNvLK9/D+TvI4daLk/Dh1
         qnog==
X-Forwarded-Encrypted: i=1; AJvYcCUYVK6utia4IM2grgKoiQsr92XxwBSzzOhwQkmjefAMFaGzFPKKaCQDs3MMtptNo0828M4HEitc4/U2ig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza+XRSBs5dZqV2EgASeotX0DkuOAC4qf+moRVI3oW53+L6MIUC
	w2z8SnxhVy1jPzHTJ/WKTc8EpSyK4WbRCoOa6U1VkVtNfk9pyDrpiSD4zmcar15RZQmtSytzOIc
	HUGMGo29yz4f/KBJVEs89smZkp8woRolOrB3ZRxMC4aASgFPGVx99Uj1LKVQvZe8SExCS/eRBnB
	5K+EUfAPVxihoGtgZT/0po2Iu3pnoi04wlLgOumHA7
X-Gm-Gg: ASbGncuM6FCiO242ze6PzawZ10xWd3cOohP0LBEqs+xv+VS6trErjNLk2cXglUBmvNg
	v/aJfF0jF50EqekT2P8u4FssvHSIgIeKr6NzSFwvJ+AZa4mGGOLYFYGfU1IKBCb/tv0bb5w==
X-Received: by 2002:a05:622a:4a17:b0:477:e78:5a14 with SMTP id d75a77b69052e-49e1dc36fddmr40528611cf.3.1748004567749;
        Fri, 23 May 2025 05:49:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOYfVGlPcg0kq1o0aMk0VZhsCjk7+njJSLhAj6B+WSC6XoeTnWcKWXbqKcZwH95XyV+O8GF6ttYKZgbiRb4jU=
X-Received: by 2002:a05:622a:4a17:b0:477:e78:5a14 with SMTP id
 d75a77b69052e-49e1dc36fddmr40528331cf.3.1748004567438; Fri, 23 May 2025
 05:49:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318205043.1043148-1-caleb.connolly@linaro.org>
In-Reply-To: <20250318205043.1043148-1-caleb.connolly@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 May 2025 14:49:15 +0200
X-Gm-Features: AX0GCFueYDukQWzrF388GReybur_0Qe2ipD7caCEPE6ktOPoIjHKF-T_UP6Rh2Q
Message-ID: <CAFEp6-3cF+Fj_f7+PqmPVy1oz0OHkpRMPQsKUTf2rhDRZrEwRg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: snoc: fix unbalanced IRQ enable in crash recovery
To: Caleb Connolly <caleb.connolly@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@kernel.org>,
        Rakesh Pillai <quic_pillair@quicinc.com>,
        Surabhi Vishnoi <quic_svishnoi@quicinc.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=68306ed8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=CibMM-rouZFaIluxMbMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BI7_Y2y5xOACnPmyunzXwAIwculRF1Li
X-Proofpoint-GUID: BI7_Y2y5xOACnPmyunzXwAIwculRF1Li
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDExMyBTYWx0ZWRfX9ZZKq5z8QWnt
 tKchcZ7mAHsP6TCd6GCzTGzLp0X5ygRVIqkxwlGhNlTkUFcV4SgcjqfPhATdAeHD2eEors2PqB0
 YoZW95IK6whhi7OaSdStRNjc6jzUuxHJuMQYR/ed0sw4/RQh5M3mTNwNtJ0I4LPnCf5g2bPFKf3
 LTg/9oobc9eSAgGj172N2q0s2GqB5DtFd2psgXiXdYe+7Hg1vW4FeutAYNLbLXVcLqMLwxpl7C/
 ZxTNMbyUHIFgsU4xObIGaWBosipKLBRtNpubiZWMHVtGDaw76TcquCotHzzyVw/EQ983IK17ZaJ
 GTVghQHtaI6BD4vgZ6FC1Vt/Rmrh3d9unV3mQzeCj/F3nlLOICWGNu/utZck46oh0d2KcgmeY8B
 DVt2T1DFKFM5i4hk5ACuwlzHn48x3ZaQqnHqJ/A+G+AVBEUukphD+88LFypd3cqsDjEhkVAx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=600 bulkscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230113

On Tue, Mar 18, 2025 at 8:50=E2=80=AFPM Caleb Connolly
<caleb.connolly@linaro.org> wrote:
>
> In ath10k_snoc_hif_stop() we skip disabling the IRQs in the crash
> recovery flow, but we still unconditionally call enable again in
> ath10k_snoc_hif_start().
>
> We can't check the ATH10K_FLAG_CRASH_FLUSH bit since it is cleared
> before hif_start() is called, so instead check the
> ATH10K_SNOC_FLAG_RECOVERY flag and skip enabling the IRQs during crash
> recovery.
>
> This fixes unbalanced IRQ enable splats that happen after recovering from
> a crash.
>
> Fixes: 0e622f67e041 ("ath10k: add support for WCN3990 firmware crash reco=
very")
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>

Tested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
