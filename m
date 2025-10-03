Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A9F175BF
	for <phone-devel@vger.kernel.org>; Fri,  3 Oct 2025 19:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759520226; cv=none; b=pnWZDZH0M5TjezyJgTGnZ9FjW2OOu9vHy8s5R5xwRwSSX8g+GA3oqBp/5MVh0FRzYj91TDSOAecDzWNNvNNqP0h65l23iO2gPhOEct72E0NkD08c6JT73T5x0Hw/EKSC5tsmqVWGxAxbnFyJ1rmI8qG1VfmoyOzmq71li4quqX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759520226; c=relaxed/simple;
	bh=2xkx+Gqn++j+/JEZH+TJfIUQdtEldaU/S5mCCrdtJU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWXf98HQAR3OBRSMyhbqOXspB5an+VTVYH1LWEfdRmwcGo7GvlAEhaNPq9k6P3WpFVTkdEZ98iyKcL+N/G8pg4Ghy6JA0Rhz06rEI620uTBxhwAnITn9gTWlvOOZRJ10nVAoCK2kv1Jus56vkIN9sU+KZHdOU9PwjS5zEkZsp/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F4xBIHQO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F4xBIHQO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 593A1geQ022701
	for <phone-devel@vger.kernel.org>; Fri, 3 Oct 2025 19:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hW5BPFSrgags4e9rk980QW7r
	yzTUgv64kGyaZ19aEoM=; b=F4xBIHQOo3P4jhJ66VWyHrnk7jnCiyGDv9Uy3Ne6
	XK/f8CFGbS4iwbBZnfnTo6JXq/Q4ukfsGcNBGG94TjsRrhJlr/XiJoDGS5brlf+j
	cN3Ff6Dlxnbmay8rrJW4JJ4YiZdp4p0kZarQEfHeU9tFEmTYYRtJo9MLw8SO1SvF
	Zgf/5NXE1us+wPNn+qfIeF4OeEPuUxFZJUN2Pe8z/wkXIvQ4hqta2NpNgVSkLDHK
	LfxL8u5V6bbF0srxCb49ti91RNjtaFMghLMhEK7hOd5fLlUGuktdqjraNtruRQRK
	tTA7PC42FIeT6jfXNfhtbkMq1dAQkoPAfGro2qOxYUcZSg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59nc5tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 19:37:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4dbd8484abbso35671521cf.0
        for <phone-devel@vger.kernel.org>; Fri, 03 Oct 2025 12:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759520223; x=1760125023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hW5BPFSrgags4e9rk980QW7ryzTUgv64kGyaZ19aEoM=;
        b=egXz2MLBLSL6ncWZst1ciFgyIzOqqeenvVDhk0+tnbnPFXs/Il/OX8Y5rXq3ZM6nCx
         kA+t62Qq+h9HR6n9VzemG4LittnJEvzNKCE9T5rzPw4A5soPAAGEIfNCvUHWJ4X9R62c
         gNUkN4dZ6/mfh+IHfqXgcCsAWZSqouqj4P77ICCGEVWA2zp6v9BSOKiWjUu2e/9lmgWy
         HdMDNHYU6uh0z5ouDnHOkDnF0QZKk8zpLGJCS00UsmkDSTPAlKbxhjcYM01Mw+fZ+O6d
         rBC3pCNKEpMgOt1jhWPGUNUZyEx994ryYCSZygUskPNCgP4huViRjDTvPepai1XRkZpd
         xlXA==
X-Forwarded-Encrypted: i=1; AJvYcCWVByr1KCYpdGPs+0Y9RICb/dpJzwfsWFOKdI7X9afgAz4zN8WjbK/EodkSKZAXHGeA5qu1LFHrBrReNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIeSJGzl7dhFDzkYnqI2ZUuRuWkGKVLDxSTbgo9h4qsa89oGWe
	1ERvs920TXrjzesv7jQrVGkbjtqzbV2DkEsITpxcA70z5OdVxZAt3c2k6BPnPqYyNRxMoW2Ex3w
	EFo/TzuGedB/666bhoms1S0aXx7Uyr8ujJrWN01WArMR7H/5RDhS6yij4ttgZaWU2laFVnsBROw
	==
X-Gm-Gg: ASbGncsHkk0sW1m4XXPdn3hJBY5sR0ZGFwZoBHJ/zRzjhxi1PU+3chU+iXHeK0g1UZT
	Rf/JL/OUr1/5pNL2hP/cikf+8kwSQgBjr/+C0Rs3UiY2Jsco18Pa7B7orbByqrbz0paJWNzr6zK
	cuCn2z+vYk1CKoz8z9f+Yq32YGsS8xUc2CfHSCVPpoWyft5qP/pSRaVBJNE5dZSutUtrszjJFNH
	NP2mhnaFjutss0QNLfPDfd8T+EG8Qd0XwwLWZd8EzubeCUl0EZbtaWP998oU4iUs29K1f/pXYAY
	5wwZfpN3vkgRSFKteLooorCSB2UpMrCYZfvUbAasW77lnJk8p9J3aSBdM5dhfDFyySYEzp4+tSv
	D9Ns1jkPlLRoHHkbJujHHJz1hY20lHU253oKktpqPp72QUHF2pLmKTCSlTw==
X-Received: by 2002:a05:622a:411b:b0:4b7:9c98:aed6 with SMTP id d75a77b69052e-4e576ada47bmr63480761cf.41.1759520223286;
        Fri, 03 Oct 2025 12:37:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHzYqAtz79UldeuWXluxUDIsWKIiRIS16dQs1C6L6K3uum8zW0I06HKp+YKgRVXueXdfeNRQ==
X-Received: by 2002:a05:622a:411b:b0:4b7:9c98:aed6 with SMTP id d75a77b69052e-4e576ada47bmr63470831cf.41.1759520209476;
        Fri, 03 Oct 2025 12:36:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0113b437sm2110367e87.43.2025.10.03.12.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 12:36:48 -0700 (PDT)
Date: Fri, 3 Oct 2025 22:36:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v3 07/11] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Add wifi node
Message-ID: <budxy3xza3ieykmrp2anpiz3gktq6mc3pqohkf6ew23jun3po3@jv2em5mmhjts>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-7-b14cf9e9a928@postmarketos.org>
 <f58493a9-6def-4610-9c3e-d6a877dc23d3@oss.qualcomm.com>
 <d38801bc77ad00442b1669ea252ae30a5c6af5b4@postmarketos.org>
 <7661d9d9-eca3-4708-8162-960df0d7f6c7@oss.qualcomm.com>
 <ad721948b83a54eaa34f367e12564fe6acc222a1@postmarketos.org>
 <gfbvgsen75w5h7afyo454pvdfslkeprqyuycuok6syinbza7vx@crapzdo33re7>
 <b9285a2e81ca992b9fc560c78ae03921000e388e@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9285a2e81ca992b9fc560c78ae03921000e388e@postmarketos.org>
X-Proofpoint-GUID: 3hG-tQUZxta47w3DTzARKaxnmjXTblgm
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68e025e0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=RrlILGEu0WOW5ijQb6sA:9 a=lqcHg5cX4UMA:10
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 3hG-tQUZxta47w3DTzARKaxnmjXTblgm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfXyRlmqcJ+Fmc8
 CA38o71KxyE0gV3fpAv4x1f23+0UzZB2dLxG7qISMp/cTfIN5y57oskkm5jZ9M468lEg6a3ehqA
 mDD8oWmwkvQodHcMOTVwcmGVdHUC1izxaS7SpfMZV32G8AbWiiDZbxxbHftDT3nnwiCehabx9pT
 xtmujoq3k1LlqM6DWyI80IImKdb5vTHRU3n9JORnM7I8WKYWZeVZ9FYBeWXypRIOaDgNcHITvDC
 A8okUsB57esP385QdgzuvnQ3YMK9R7lybhZbDzU2lSrV/AC9SV0X5BNEy7enMUtXRugzvN7zZu+
 GYJLa4ubKqFXcO8lbVGuCD6T1/EVcEcKw2YGmxtqa2cecZFf0JNosiuw+tKvTH93ZdwBkrGRtEt
 R11p4my5Wtz57K9pNbRWb4R39YKVng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_06,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On Fri, Oct 03, 2025 at 06:52:03PM +0000, Paul Sajna wrote:
> October 3, 2025 at 5:13 PM, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com mailto:dmitry.baryshkov@oss.qualcomm.com?to=%22Dmitry%20Baryshkov%22%20%3Cdmitry.baryshkov%40oss.qualcomm.com%3E > wrote:
> 
> 
> 
> > Regarding the MDSS. Is it being solved by adding reset to the MDSS node?
> > Or are there any other issues?
> 
> Yes I'm referring to the reset / pmdomain issue. Joel Selvaraj is looking into it in the sdm845 tree. He said he tried doing what other SOCs did and it just got stuck in a reboot loop. More investigation required. Currently he's reverted the pmdomain commits in our tree.

Which pmdomain commits?

-- 
With best wishes
Dmitry
